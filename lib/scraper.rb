require "pry"
require "nokogiri"
require "open-uri"
require "mechanize"

#agent = Mechanize.new

class Scraper

    def self.retrieve_all_course_data #=> scrapes all courses from site as a hash
        agent = Mechanize.new
        main_link = "https://www.merlot.org/merlot/materials.htm?hasAwards=false&hasComments=false&hasCourses=false&filterTypesOpen=false&dateRange=0&hasEtextReviews=false&hasPeerReviews=false&fromContentBuilderSawDialog=false&audience=5,6,7&materialType=10&isLeadershipLibrary=false&hasCollections=false&filterOtherOpen=false&isContentBuilder=false&filterSubjectsOpen=true&hasAccessibilityForm=false&hasAssignments=false&filterPartnerAffiliationsOpen=true&hasRatings=false&hasSercActivitySheets=false&days=7&filterMobileOpen=false&sort.property=overallRating&hasEditorReviews=false&page=1"
        page = Nokogiri::HTML(open(main_link))
        crawl = agent.get(main_link)
        binding.pry
        page.css("div .merlot-material-item").collect do |course| 
            title = course.css('a')[0].text.strip.gsub(/(\n| )/,"_")
            date_created = course.css("div .merlot-material-item dl dd")[2]
            date_updated = course.css("div .merlot-material-item dl dd")[3]
            course_rating = course.css("dd .sr-only")[0].text

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
        # next_page = "current_page" + .css("li a.page-link")[7].attribute("href").text

    end    


end

Scraper.retrieve_all_course_data

#card merlot-material-item
#new_page = agent.get("https://www.merlot.org/merlot/materials.htm?hasAwards=false&hasComments=false&hasCourses=false&filterTypesOpen=false&dateRange=0&hasEtextReviews=false&hasPeerReviews=false&fromContentBuilderSawDialog=false&audience=5,6,7&materialType=10&isLeadershipLibrary=false&hasCollections=false&filterOtherOpen=false&isContentBuilder=false&filterSubjectsOpen=true&hasAccessibilityForm=false&hasAssignments=false&filterPartnerAffiliationsOpen=true&hasRatings=false&hasSercActivitySheets=false&days=7&filterMobileOpen=false&sort.property=overallRating&hasEditorReviews=false&page=1")
# course page = new_page.link_with(:href => class link ).click
# course page uri = new_page.link_with(:href => class link").click.uri.to_s
# course page begin scrape = Nokogiri::HTML(open(new_page.link_with(:href => class link").click.uri.to
## course category = page.css("div .hitlist-image img")[0].attribute("data-icon").text



# test = crawl.link_with(:text => page.css("div .merlot-material-item a")[0].text).click
# test.uri.to_s
# new_page = Nokogiri::HTML(open(test.uri.to_s))

# 1. scrape all courses on page
# 2. go to next page
# 3. repeat until no pages left

# next_page = page  .css("li a.page-link")[7].attribute("href").text
# interates over course titles for page => page.css("div .merlot-material-item").map {|course| course.css('a')[0].text.strip.gsub(/(\n| )/,"_")}