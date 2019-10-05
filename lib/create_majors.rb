require_relative 'major.rb'

class Create_majors
    
    def initialize
        Major.new("Management", [
            ["Economics", nil],
            ["Business", "Management"],
            ["Business", "Management"],
            ["Accounting", nil],
            ["Statistics and Probability", "Statistics"],
            ["Statistics and Probability", "Statistics"],
            ["Marketing", "Advertising"],
            ["Marketing", "Advertising"]
        ])
        Major.new("Political Science", [
            ["Political Science", nil],
            ["Political Science", nil],
            ["Social Sciences", "Political Science"],
            ["Humanities", "History"],
            ["American Studies", nil],
            ["Social Sciences", "Gender"],
            ["Social Sciences", "Law"],
            ["Social Sciences", "History"]
        ])
        Major.new("Computer Science and Engineering", [
            ["Computer Science", "Programming & Programming Languages"],
            ["Computational Science", "Discrete Mathematics"],
            ["Communication Studies", nil],
            ["Software Engineering", nil],
            ["Algorithms and Complexity", nil],
            ["Algorithms and Complexity", nil],
            ["Algorithms and Complexity", nil],
            ["Computer Science", "Architecture and Organization"]
        ])        

    end

end