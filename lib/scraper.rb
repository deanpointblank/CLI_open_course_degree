require "pry"
require "nokogiri"
require "open-uri"
require "mechanize"

agent = Mechanize.new

class Scraper

    def self.retrieve_all_courses
        page = Nokogiri::HTML(open("https://www.merlot.org/merlot/materials.htm?hasAwards=false&hasComments=false&hasCourses=false&filterTypesOpen=false&dateRange=0&hasEtextReviews=false&hasPeerReviews=false&fromContentBuilderSawDialog=false&audience=5,6,7&materialType=10&isLeadershipLibrary=false&hasCollections=false&filterOtherOpen=false&isContentBuilder=false&filterSubjectsOpen=true&hasAccessibilityForm=false&hasAssignments=false&filterPartnerAffiliationsOpen=true&hasRatings=false&hasSercActivitySheets=false&days=7&filterMobileOpen=false&sort.property=overallRating&hasEditorReviews=false&page=1"))
        binding.pry
        # course title = page.css("div .merlot-material-item a")[0].children.text
        # course category = page.css("div .hitlist-image img")[0].attribute("data-icon").text
        # date created = page.css("div .merlot-material-item dl dd")[2]*
        # date updated = page.css("div .merlot-material-item dl dd")[3]*
        # class rating = page.css("dd .sr-only")[0].text
        # class description = 
        # class link =
        # class level =
    end    


end

Scraper.retrieve_all_courses

#card merlot-material-item