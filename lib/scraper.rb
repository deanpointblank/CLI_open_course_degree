require "pry"
require "nokogiri"
require "open-uri"
require "mechanize"

#agent = Mechanize.new

class Scraper
    # 1. scrape all courses on page
    # 2. go to next page
    # 3. repeat until no pages left
    def self.retrieve_all_course_data #=> scrapes all courses from site as a hash
        agent = Mechanize.new
        site = "https://www.merlot.org/merlot/materials.htm?hasAwards=false&hasComments=false&hasCourses=false&filterTypesOpen=false&dateRange=0&hasEtextReviews=false&hasPeerReviews=false&fromContentBuilderSawDialog=false&audience=5,6,7&materialType=10&isLeadershipLibrary=false&hasCollections=false&filterOtherOpen=false&isContentBuilder=false&filterSubjectsOpen=true&hasAccessibilityForm=false&hasAssignments=false&filterPartnerAffiliationsOpen=true&hasRatings=false&hasSercActivitySheets=false&days=7&filterMobileOpen=false&sort.property=overallRating&hasEditorReviews=false&page=1"
        current_page = Nokogiri::HTML(open(site))
        crawl = agent.get(site)
        i = 0
        scraped_courses = []
            while crawl.link_with(:href => current_page.css("li a.page-link")[7].attribute("href").text) && i != 10
                current_page = Nokogiri::HTML(open(site))
                crawl = agent.get(site)
                current_page.css("div .merlot-material-item").each do |course|
                    course_page = crawl.link_with(:href => course.css("div a")[0].values[0]).click
                    scraped_courses << {
                        :course_name => course.css('a')[0].text.strip.gsub(/(\n| )/,"_").gsub(/.*_{2,}/,""),
                        :date_created => course.css("div dl dd")[2].text,
                        :date_updated => course.css("div dl dd")[3].text,
                        :course_rating => course.css("dd .sr-only")[0].text,
                        :course_disciplines => course_page.css(".list-small-mb li span").map {|discipline| discipline.css("a").text},
                        :course_description => course_page.css("div .mb-3 p").text,
                        :course_level => course_page.css("dd .noWrap a").map {|level| level.text},
                        :material_requirements => course_page.css("div .detail-more-about dd")[8].text,
                        :course_link => crawl.link_with(:text => current_page.css("div .merlot-material-item a").text)
                    }
                end
                site = crawl.link_with(:href => current_page.css("li a.page-link")[7].attribute("href").text).click.uri.to_s
                i += 1
            end

        # next_page = crawl.link_with(:href => current_page.css("li a.page-link")[7].attribute("href").text).click

    scraped_courses
    end
    
    def self.auto_retrieve_all_course_data_by_discipline(subject)
        agent = Mechanize.new
        current_page = Nokogiri::HTML(open(subject))
        crawl = agent.get(subject)
        i = 0
        scraped_courses = []
        while i != 1 || current_page.css("li a.page-link")[7]
            current_page = Nokogiri::HTML(open(subject))
            crawl = agent.get(subject)
            current_page.css("div .merlot-material-item").each do |course|
                course_page = crawl.link_with(:href => course.css("div a")[0].values[0]).click
                #binding.pry
                scraped_courses << {
                    :name => course.css('a')[0].text.strip.gsub(/(\n| )/,"_").gsub(/.*_{2,}/,""),
                    :date_created => course.css("div dl dd")[2].text,
                    #:date_updated => course.css("div dl dd")[3].text,
                    #:course_rating => course.css("dd .sr-only").children[1].text,
                    :course_disciplines => course_page.css(".list-small-mb li span").map {|discipline| discipline.children[1].text},
                    :course_description => course_page.css("div .mb-3 p").text,
                    :course_level => course_page.css("dd .noWrap a").map {|level| level.text},
                    :material_requirements => course_page.css("div .detail-more-about dd")[8].text.strip,
                    :course_link => crawl.link_with(:text => current_page.css("div .merlot-material-item a").text)
                }
                if scraped_courses.length == 5
                    break
                end
            end
            if current_page.css("li a.page-link")[7]
                subject = crawl.link_with(:href => current_page.css("li a.page-link")[7].attribute("href").text).click.uri.to_s
            else
                break
            end
            i += 1
        end
        scraped_courses
    end


end

#Scraper.retrieve_all_course_data
# 1 site > page 2 scrape, 3 create, > 4 next_page/site





################################################### Course Iteration vars ###########################################################
        #binding.pry
        # course title = page.css("div .merlot-material-item a")[0].text
        # course disciplines = test.css(".list-small-mb li span").map {|discipline| discipline.text.gsub(/( |\/)/, "").strip}
        # date created = page.css("div .merlot-material-item dl dd")[2]*
        # date updated = page.css("div .merlot-material-item dl dd")[3]*
        # course rating = page.css("dd .sr-only")[0].text
        # course description = test.css("div .mb-3 p").text
        # course link = page.css("div .merlot-material-item a")[0].text)
        # course resources = test.uri.to_s
        # course level = new_page.css("dd .noWrap a").map {|level| level.text}
        # material requirements = new_page.css("div .detail-more-about dd")[8].text



        #card merlot-material-item
        #new_page = agent.get("https://www.merlot.org/merlot/materials.htm?hasAwards=false&hasComments=false&hasCourses=false&filterTypesOpen=false&dateRange=0&hasEtextReviews=false&hasPeerReviews=false&fromContentBuilderSawDialog=false&audience=5,6,7&materialType=10&isLeadershipLibrary=false&hasCollections=false&filterOtherOpen=false&isContentBuilder=false&filterSubjectsOpen=true&hasAccessibilityForm=false&hasAssignments=false&filterPartnerAffiliationsOpen=true&hasRatings=false&hasSercActivitySheets=false&days=7&filterMobileOpen=false&sort.property=overallRating&hasEditorReviews=false&page=1")
        # course page = new_page.link_with(:href => class link ).click
        # course page uri = new_page.link_with(:href => class link").click.uri.to_s
        # course page begin scrape = Nokogiri::HTML(open(new_page.link_with(:href => class link").click.uri.to
        ## course category = page.css("div .hitlist-image img")[0].attribute("data-icon").text



        # test = crawl.link_with(:text => page.css("div .merlot-material-item a")[0].text).click
        # test.uri.to_s
        # new_page = Nokogiri::HTML(open(test.uri.to_s))


        # next_page = page  .css("li a.page-link")[7].attribute("href").text
        # interates over course titles for page => page.css("div .merlot-material-item").map {|course| course.css('a')[0].text.strip.gsub(/(\n| )/,"_")}

###################################################### Load
# 1.upto(100) do |i|
#     printf("\rPercentage: %%", i)
#     sleep(0.1)
#   end
# puts