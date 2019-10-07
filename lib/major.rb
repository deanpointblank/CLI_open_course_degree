require "pry"
require_relative 'course.rb'


class Major
    attr_accessor :name, :general_requirements, :major_requirements, :current_courses
    
    @@all = []

    def initialize(name, major_requirements = nil)
        @name = name
        @@all << self
        @major_requirements = major_requirements
        @current_courses = []
    end

    def self.all
        @@all
    end

    def general_requirements
        @general_requirements = [
            ["Biology", "Genetics"],
            ["Physics", "Environment and Natural Resourses"],
            ["Geoscience", "Biochemistry"],
            ["Statistics And Probability", "Pre Calculus Mathematics"],
            ["Calculus", "Discrete Mathematics"],
            ["Exercise Science", "Algebra and Number Theory"],
            ["History", "Sociology"],
            ["History", "Psychology"],
            ["Philosophy", "Political Science"],
            ["World Languages", "Environmental Studies"],
            ["Humanities", "Law"],
            ["Women and Gender Studies", "Sports And Games"]
        ]
        # @course_disciplines = [("Mathematics and Statistics" || "Science and Technology" ) && ("SocialSciences " || "Humanities " || "Arts" ))]
        # @course_level.include?("College General Ed" || "College Lower Division")
    end
    
    # def freshman_courses
    #     @freshman_courses = []
    # end

    # def sophomore_courses
    #     @sophomore_courses = []
    # end

    # def junior_courses
    #     @junior_courses = []
    # end

    # def senior_courses
    #     @senior_courses = []
    # end

    # def all_courses
    #     puts "freshman level courses: "
    #     freshman_courses.each do |course|
    #         puts course
    #     end
    #     puts "sophomore level courses: "
    #     sophomore_courses.each do |course|
    #         puts course
    #     end
    #     puts "junior level courses: "
    #     junior_courses.each do |course|
    #         puts course
    #     end
    #     puts "senior level courses: "
    #     senior_courses.each do |course|
    #         puts course
    #     end
    # end

end



# a major carries many subjects in order of dificulty
# draws from the subject class to meet its criteria

# name => Political_Science
# general_requirements =>  [ScienceandTechnology x6, Humanities x8]
# major_requirements =>   [("college upper division" | "Gaduate School" )-PoliticalScience x4,
#                         american_politics x1, Sociology x1, international_politics x2]

# name => Computer_science_and_engineering
# general_requirements =>  [ScienceandTechnology x6, Humanities x8]
# major_requirements =>   [ComputeScience x1, low_division-ComputerScience x7, ("college upper division" | "Gaduate School" )-ComputerScience x2,
#                         professional_division_compsci x1]

# name => Management
# general_requirements =>  [ScienceandTechnology x6, Humanities x8]
# major_requirements =>   [communication x2, statistics x2, Business-("college upper division" | "Gaduate School" ) x2,
#                         Business-professional x5]

#checks to see if course is included => course.course_disciplines.any? {|course| course == subject1 || course == subject2}