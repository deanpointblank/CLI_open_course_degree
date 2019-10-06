require "pry"
require_relative 'scraper.rb'
require_relative 'Concerns/subjects_module.rb'
require_relative 'major.rb'

class Course
    # extend Subjects::Business, Subjects::Humanities, Subjects::Math, Subjects::Social_science, Subjects::Science
    extend Subjects

    attr_accessor :name, :date_created, :course_disciplines, :course_description, :course_level, :material_requirements, :course_link #:date_updated #:course_rating

    SUBJECTS = ["Business", "Humanities", "Mathematics and Statistics", "Social Sciences", "Science"]

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
        #binding.pry
    end

    def self.get_rand_course(discipline)
        self.all.clear
        discipline = discipline.downcase.gsub(/ /, "_")
        if business_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(business_studies.fetch(discipline)))        
        elsif humanities_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(humanities_studies.fetch(discipline)))        
        elsif mathematics_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(mathematics_studies.fetch(discipline)))        
        elsif statistics_and_probability_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(statistics_and_probability_studies.fetch(discipline)))        
        elsif social_sciences_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(social_sciences_studies.fetch(discipline)))        
        elsif agiculture_and_environmental_sciences_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(agiculture_and_environmental_sciences_studies.fetch(discipline)))        
        elsif biology_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(biology_studies.fetch(discipline)))        
        elsif chemistry_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(chemistry_studies.fetch(discipline)))        
        elsif communication_sciences_and_disorders_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(communication_sciences_and_disorders_studies.fetch(discipline)))        
        elsif computer_science_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(computer_science_studies.fetch(discipline)))        
        elsif engineering_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(engineering_studies.fetch(discipline)))        
        elsif geoscience_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(geoscience_studies.fetch(discipline)))        
        elsif health_sciences_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(health_sciences_studies.fetch(discipline)))        
        elsif information_technology_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(information_technology_studies.fetch(discipline)))        
        elsif kinesiology_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(kinesiology_studies.fetch(discipline)))        
        elsif nanotechnology_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(nanotechnology_studies.fetch(discipline)))        
        elsif physics_studies.keys.include?(discipline)
                self.mass_create_courses(Scraper.auto_retrieve_all_course_data_by_discipline(physics_studies.fetch(discipline)))
        else
            begin
                raise StandardError
            rescue => exception
                
            end        
        end
        self.all.each_with_index do |course , x|
            puts "#{x+1}. #{course.name}"
            puts "  #{course.course_description}"
            puts "\n"
        end
    end

    # def self.mass_random_load
    #     3.times do 
    #         self.get_rand_course(business_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(humanities_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(mathematics_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(statistics_and_probability_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(social_sciences_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(agiculture_and_environmental_sciences_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(biology_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(chemistry_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(communication_sciences_and_disorders_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(computer_science_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(engineering_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(geoscience_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(health_sciences_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(information_technology_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(kinesiology_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(nanotechnology_studies.keys.sample)
    #     end
    #     3.times do 
    #         self.get_rand_course(physics_studies.keys.sample)
    #     end
    #     binding.pry
    # end
        
 
end