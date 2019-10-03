require "pry"

class Course
    attr_accessor :course_name, :date_created, :date_updated, :course_rating, :course_discplines, :course_description, :course_level, :material_requirements, :course_link

    @@all = []

    def initialize(course_hash)
        course_hash.each { |key, value| self.send("#{key}=", value)}
        @@all << self
    end


binding.pry
end

