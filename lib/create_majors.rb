require_relative 'major.rb'

class Create_majors
    
    def initialize
        Major.new("Management", [
            ["Economics", nil],
            ["Coporate Social Responsibility", "Management"],
            ["Business Law", "Management"],
            ["Accounting", nil],
            ["Statistics and Probability", "Statistics"],
            ["Statistics and Probability", "Statistics"],
            ["Marketing", "E Commerce"],
            ["Marketing", "international_buisness"]
        ])
        Major.new("Political Science", [
            ["Political Science", nil],
            ["Political Science", nil],
            ["Psychology", "Political Science"],
            ["comparitive_literature_and_classics", "History"],
            ["American Studies", "American Studies"],
            ["Sociology", "Women and Gender Studies"],
            ["Communication Studies", "Law"],
            ["American Studies", "History"]
        ])
        Major.new("Computer Science and Engineering", [
            ["Computer Science", "Programming and Programming Languages"],
            ["computer_engineering", "Discrete Mathematics"],
            ["Communication Studies", nil],
            ["Software Engineering", nil],
            ["Algorithms and Complexity", nil],
            ["Algorithms and Complexity", nil],
            ["Algorithms and Complexity", nil],
            ["Computer Science", "Architecture and Organization"]
        ])        

    end

end