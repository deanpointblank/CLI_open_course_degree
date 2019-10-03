require "pry"

class Course
    attr_accessor :course_name, :date_created, :date_updated, :course_rating, :course_disciplines, :course_description, :course_level, :material_requirements, :course_link

    @@all = []


    def initialize(new_course)
        new_course.each do |attribute, value|
            self.send("#{attribute}=", value)
        end
        @@all << self

    end

    def self.all
        @@all
    end

    def self.mass_create_courses(course_hash)
        course_hash.each do |course|
            self.new(course)
        end
        binding.pry
    end

end
 
Course.mass_create_courses(Scraper.retrieve_all_course_data)

