require "pry"
require "time"
require_relative 'course.rb'
require_relative 'scraper.rb'
require_relative 'major.rb'
require_relative 'create_majors.rb'


class Cli
    include Subjects #::Business, Subjects::Humanities, Subjects::Math, Subjects::Social_science, Subjects::Science
    attr_accessor :current_major

    def initialize
        Create_majors.new
        #Course.mass_random_load
        call
    end
  
    def call

        input = nil
        while input != "exit"
            puts "Welcome to Open Course Major"
            puts "\n"
            puts "To list all of current Open course Majors available, enter 'Majors'."
                #=> choose your major
            puts "To list all of the course sujects 'all subjects'."
            puts "To quit, type 'exit'."
            puts "\n"
            puts "What would you like to do?"
            puts "\n"
            input = gets.chomp
            case input.downcase
            when "majors"
                puts "\n"
                list_majors
            when "all subjects"
                puts "\n"
                all_courses
            when "exit"
                goodbye
            end
        end
    end

    def goodbye
        "\n"
        puts "Now exiting the program"
        "\n"
        puts "Goodbye!"
        exit
    end 

    def save
        puts "\n"
        puts "Do you wish to save you course?"
        puts "enter 'y' for Yes or 'n' for No"
        puts "\n"
        input = gets.chomp.downcase
            if input == "y"
                file = File.open("#{current_major.name} - #{Time.now}.txt", "w") do |file|
                    file.write "#{current_major.name} - #{Time.now}"
                    file.write "\n"
                    file.write "\n"
                    file.write "#{current_major.name}"
                    file.write "\n"

                    current_major.current_courses.each do |course|
                        file.write "\n"
                        file.write "  #{course.name}"
                        file.write "\n"
                        file.write "\n"
                        file.write "      #{course.date_created}"
                        file.write "\n"
                        file.write "      #{course.course_disciplines}"
                        file.write "\n"
                        file.write "      #{course.course_description}"
                        file.write "\n"
                        file.write "      #{course.course_level}"
                        file.write "\n"
                        file.write "      #{course.material_requirements}"
                        file.write "\n"
                        file.write "      #{course.course_link}"
                    end
                end
                puts "Your courses are saved!"
                puts "Taking you back to they main menu.."
                puts "\n" 
                call 
            elsif input == "n"
                puts "Taking you back to they main menu.."
                puts "\n"
                call
            end

        end
    end

    def list_majors
        input = nil
        # displays major name
        # displays major req
        major_list = Major.all.each_with_index do |major, i|
            puts "#{i + 1}. #{major.name}"
        end
        puts "\n"
        puts "to choose a major and start building you course, enter the number next to your major"
        puts "else enter 'back' to go to the main menu"
        puts "\n"
        puts "which major would you like? "
        input = gets.chomp
        puts "\n"
        i = 0
        list = major_list.map {|x| (i+=1).to_s}
        if list.include?(input)
            i = 0 
            while input != nil
                input = input.to_i
                if input > major_list.length || input < 0
                    puts "Looks like you entered an invalid number."
                    puts "Please try again"
                    puts "\n"
                    list_majors
                    puts "\n"
                else
                    @current_major = major_list[input - 1]
                    puts "\n"
                    build_major
                end            
            end
        elsif input.downcase == "back"
            call
        else
            i = 0
            puts "\n"
            puts 'Looks likes thats not a valid entry...'
            puts 'Please try again'
            list_majors
            puts "\n"
        end
    end

    def all_courses
        # display all subjects available
        # when user hits next 15 more courses populatet
        # when user types back it returns user to current_major
        Course::SUBJECTS.each do |subject|
            puts subject
        end
        puts "\n"
        input = nil
        while input != "exit"
            puts "\n"
            puts "To see sub-diciplines within the subject, enter the subject's name"
            puts "To go back to subjects enter 'subjects'"
            puts "To go back to main menu enter 'menu'"
            puts  "To exit enter exit"
            puts "\n"
            puts "What would you like to do?"
            puts "\n"
            input = gets.chomp
            case input.downcase
                when "business"
                    puts "\n"
                    
                    business_studies.each do |name, link|
                         puts name.gsub(/_/, " ").capitalize 
                    end
                when "humanities"
                    puts "\n"
                    humanities_studies.each do |name, link|
                        puts name.gsub(/_/, " ").capitalize 
                   end
                when "mathematics and statistics"
                    puts "\n"
                    mathematics_studies.each do |name, link|
                        puts name.gsub(/_/, " ").capitalize 
                   end
                    statistics_and_probability_studies.each do |name, link|
                        puts name.gsub(/_/, " ").capitalize 
                   end
                when "social sciences"
                    puts "\n"
                    social_sciences_studies.each do |name, link|
                        puts name.gsub(/_/, " ").capitalize
                   end
                when "menu"
                    call
                when "science"
                    puts "Science is a huge subject that has subdiciplines which themselves have subdisciplines"
                    puts "Please select a sub-discipline from the list to see more subjects."
                    puts "\n"
                    puts "Agiculture and environmental sciences"
                    puts "Biology"
                    puts "Chemistry"
                    puts "Communication sciences and disorders"
                    puts "Computer science"
                    puts "Engineering"
                    puts "Geoscience"
                    puts "Health sciences"
                    puts "Information technology"
                    puts "Kinesiology"
                    puts "Nanotechnology"
                    puts "Physics"
                    puts "\n"
                    puts "To see sub-diciplines within the discipline, enter the dicipline's name"
                    puts "To go back to subjects enter 'subjects'"
                    puts "To go back to main menu enter 'menu'"
                    puts "To exit enter exit"
                    puts "\n"
                    puts "What would you like to do?"
                    puts "\n"
                    input = gets.chomp
                    case input.downcase
                    when "agiculture and environmental sciences" 
                        puts "\n"
                        agiculture_and_environmental_sciences_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "biology"
                        puts "\n"
                        biology_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "chemistry"
                        puts "\n" 
                        chemistry_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "communication sciences and disorders"
                        puts "\n" 
                        communication_sciences_and_disorders_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "computer science"
                        puts "\n"
                        computer_science_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "engineering"
                        puts "\n"
                        engineering_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "geoscience"
                        puts "\n"
                        geoscience_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "health sciences"
                        puts "\n"
                        health_sciences_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "information technology"
                        puts "\n"
                        information_technology_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "kinesiology"
                        puts "\n"
                        kinesiology_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "nanotechnology"
                        puts "\n" 
                        nanotechnology_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "physics"
                        puts "\n" 
                        physics_studies.each do |name, link|
                            puts name.gsub(/_/, " ").capitalize
                        end
                    when "subjects"
                        puts "\n"
                        all_courses
                    when "menu"
                        call
                    when "exit"
                        goodbye
                    end
                when "subjects"
                    puts "\n"
                    all_courses
                when "exit"
                    goodbye    
                end
            
        end
    end

    def build_major
        input = nil
        # begins the process of creating your major
        puts "\n"
        puts current_major.name
        puts "  The general requirements for this major are: "
        puts "      6 general education 'Science' or 'Math' courses"
        puts "      6 general education 'Humanities' or 'Social Science' courses"
        puts "\n"
        puts "  The major requirements for this course are: "
        current_major.major_requirements.each do |choice|
            if choice[0] == choice[1]
                puts "      A(n) #{choice[0]} course"
            else
                puts "      A(n) #{choice[0]} or #{choice[1]} course"
            end
        end
        puts "\n"
        puts "To begin building the course enter 'build'"
        puts "To build your course with only the major requrements enter 'skinny'"
        puts "To go back to the main menu enter 'exit'"
        puts "\n"
        input = gets.chomp.downcase
        while input != nil
            case input.downcase
            when "build"
                puts "\n"
                build
            when "skinny"
                puts "\n"
                build_skinny
            when "exit"
                call
            end
        end

    end

    # def populate
    #     # populates major with random courses so long as it meets the criteria
    #     i = 0
    #     while i < current_major.major_requirements.length
    #         unless current_major.current_courses[i]
    #             current_major.major_requirements.each do |choice|
    #                 current_major.current_courses << Course.all.select(choice.sample)
    #             end
    #         end
    #         i += 1
    #         puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
    #     end
    #     current_major.current_courses.each_with_index do |course, i|
    #         puts "  #{i + 1}.   #{course.name}"
    #     end
    #     i = 0
    #     while i < current_major.general_requirements.length
	#         unless current_major.current_courses[i]
	#             current_major.current_courses << Course.get_rand_course(current_major.general_requirements[i].sample)
    #         end
    #         i += 1
    #         puts "#{i} Coures(es) added out of #{current_major.general_requirements.length} general requirements."
    #     end
    #     current_major.current_courses.each_with_index do |course, i|
    #         puts "  #{i + 1}.   #{course.name}"
    #     end
    # end
    #  ----------------------> works. but very, very slowly.

    def build
        # allows users to build course into major
        i = 1
        while i < current_major.major_requirements.length + 1
            unless current_major.current_courses[i]
                current_major.major_requirements.each do |choice|
                    if choice.include?(nil)
                        puts "\n"
                        puts "For your ##{i} choice we need a #{choice[0]} class"
                        puts "Loading #{choice[0]} classes"
                        puts "\n"
                        input = choice[0]
                        Course.get_rand_course(input) 
                        puts "To choose class enter the class number"
                        puts "\n"
                        input = gets.chomp.to_i - 1
                        puts "\n"
                        current_major.current_courses << Course.all[input]
                        puts "\n"
                        puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
                        puts "\n"
                    else
                        puts "\n"
                        puts "For your ##{i} choice we need either a #{choice[0]} or a #{choice[1]} class"
                        puts "enter '1' for #{choice[0]} or '2' for #{choice[1]}"
                        input = gets.chop.to_i - 1
                        if input == 0 
                            puts "Loading #{choice[0]} classes"
                            puts "\n"
                            input = choice[0]
                            Course.get_rand_course(input)
                            puts "To choose class enter the class number"
                            puts "\n"
                            input = gets.chomp.to_i - 1
                            puts "\n"
                            current_major.current_courses << Course.all[input]
                            puts "\n"
                            puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
                            puts "\n"                         
                        elsif input == 1
                            puts "Loading #{choice[1]} classes"
                            puts "\n"
                            input = choice[1]
                            Course.get_rand_course(input)
                            puts "To choose class enter the class number"
                            puts "\n"
                            input = gets.chomp.to_i - 1
                            puts "\n"
                            current_major.current_courses << Course.all[input]
                            puts "\n"
                            puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
                            puts "\n"
                        end
                    end
                i += 1
                end
            i
            end
        end
        current_major.current_courses.each_with_index do |course, i|
            
            puts "  #{i + 1}.   #{course.name}"
        end
        i = 1
        while i < current_major.general_requirements.length + 1
            current_major.general_requirements.each do |choice|
                if choice.include?(nil)
                    puts "\n"
                    puts "For your ##{i} choice we need a #{choice[0]} class"
                    puts "Loading #{choice[0]} classes"
                    puts "\n"
                    input = choice[0]
                    Course.get_rand_course(input) 
                    puts "To choose class enter the class number"
                    puts "\n"
                    input = gets.chomp.to_i - 1
                    puts "\n"
                    current_major.current_courses << Course.all.index[input]
                    puts "\n"
                    puts "#{i} Coures(es) added out of #{current_major.general_requirements.length} general education requirements."
                    puts "\n"
                else
                    puts "\n"
                    puts "For your ##{i} choice we need either a #{choice[0]} or a #{choice[1]} class"
                    puts "enter '1' for #{choice[0]} or '2' for #{choice[1]}"
                    input = gets.chop.to_i - 1
                    if input == 0 
                        puts "Loading #{choice[0]} classes"
                        puts "\n"
                        input = choice[0]
                        Course.get_rand_course(input)
                        puts "To choose class enter the class number"
                        puts "\n"
                        input = gets.chomp.to_i - 1
                        puts "\n"
                        current_major.current_courses << Course.all[input]
                        puts "\n"
                        puts "#{i} Coures(es) added out of #{current_major.general_requirements.length} general education requirements."
                        puts "\n"                         
                    elsif input == 1
                        puts "Loading #{choice[1]} classes"
                        puts "\n"
                        input = choice[1]
                        Course.get_rand_course(input)
                        puts "To choose class enter the class number"
                        puts "\n"
                        input = gets.chomp.to_i - 1
                        puts "\n"
                        current_major.current_courses << Course.all[input]
                        puts "\n"
                        puts "#{i} Coures(es) added out of #{current_major.general_requirements.length} general education requirements."
                        puts "\n"
                    end
                end
            i += 1
            end
        end
    end

    def build_skinny
        i = 1
        # allows users to build course into major
        while i < current_major.major_requirements.length + 1
            unless current_major.current_courses[i]
                current_major.major_requirements.each do |choice|
                    if choice.include?(nil)
                        puts "\n"
                        puts "For your ##{i} choice we need a #{choice[0]} class"
                        puts "Loading #{choice[0]} classes"
                        puts "\n"
                        input = choice[0]
                        Course.get_rand_course(input) 
                        puts "To choose class enter the class number"
                        puts "\n"
                        input = gets.chomp.to_i - 1
                        puts "\n"
                        current_major.current_courses << Course.all[input]
                        puts "\n"
                        puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
                        puts "\n"
                    else
                        puts "\n"
                        puts "For your ##{i} choice we need either a #{choice[0]} or a #{choice[1]} class"
                        puts "enter '1' for #{choice[0]} or '2' for #{choice[1]}"
                        input = gets.chop.to_i - 1
                        if input == 0 
                            puts "Loading #{choice[0]} classes"
                            puts "\n"
                            input = choice[0]
                            Course.get_rand_course(input)
                            puts "To choose class enter the class number"
                            puts "\n"
                            input = gets.chomp.to_i - 1
                            puts "\n"
                            current_major.current_courses << Course.all[input]
                            puts "\n"
                            puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
                            puts "\n"                         
                        elsif input == 1
                            puts "Loading #{choice[1]} classes"
                            puts "\n"
                            input = choice[1]
                            Course.get_rand_course(input)
                            puts "To choose class enter the class number"
                            puts "\n"
                            input = gets.chomp.to_i - 1
                            puts "\n"
                            current_major.current_courses << Course.all[input]
                            puts "\n"
                            puts "#{i} Coures(es) added out of #{current_major.major_requirements.length} major requirements."
                            puts "\n"
                        end
                    end
                i += 1
                end
            i
            end
        end
        puts "If satisfied with your selection enter 'complete'"
        puts "If not, enter 'menu' to go back to the main menu"
        puts "Else, enter 'exit' to exit program"
        puts "\n"
        input = gets.chomp.downcase
        while input != "exit"
        case input
        when "complete"
            self.complete
        when "menu"
            self.call
        when "exit"
            self.goodbye 
        end
    end

    def complete
        # shows major with all courses, and coerse data
        # ask the user if they are done
        # if returns to current_major
        puts current_major.name
        current_major.current_courses.each do |courses|
            puts "\n"
            puts "  #{course.name}"
            puts "      #{course.date_created}" 
            puts "      #{course.course_disciplines}"
            puts "      #{course.course_description}"
            puts "      #{course.course_level}"
            puts "      #{course.material_requirements}"
            puts "      #{course.course_link}"
        end
        puts "If satisfied with your selection enter 'complete'"
        puts "If not, enter 'menu' to go back to the main menu"
        puts "Else, enter 'exit' to exit program"
        puts "\n"
        binding.pry
        input = gets.chomp.downcase
        while input != "exit"
            case input
            when "complete"
                self.save
            when "menu"
                self.call
            when "exit"
                self.goodbye
            end
        end
    end

end





