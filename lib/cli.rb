require 'pry'

class cli

  
    def call
        input = nil
        while input != "exit"
            puts "Welcome to Open Course Major"
            puts "To list all of current Open course Majors available, enter 'Majors'."
            puts "To list all of the courses currently availble enter 'all courses'."
            puts "To get an Open course Major with pre-populated courses enter '<Major name>', then 'populate' "
            puts "To build your Open course Major from the courses currently available enter '<Major name>', then 'build'"
            puts "To get an Open course Major with a focus only on major-realated courses enter '<Major name>' then 'skinny'"
            puts "To save your Major's courses as a '.txt' file enter 'complete', then 'save'"
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
        end
    end

end

def majors
    # displays major name
    # displays major req
end

def all_courses
    # display all course name + descriptions, 15 at a time.
    # when user hits next 15 more courses populatet
    # when user types back it returns user to current_major
end

def current_major
    # keeps track of changes made to current major instance
end

def populate
    # create a major instance
    # populates major with random courses so long as it meets the criteria
end

def build
    # creates a major instance
    # allows users to build course into major
end


def skinny
    # removes any course within a major thats tagged as 'gen-ed'
end

def complete
    # shows major with all courses, and coerse data
    # ask the user if they are done
    # if not returns to current_major
end


def save
    # exports currnet_major as a '.txt' file
end
