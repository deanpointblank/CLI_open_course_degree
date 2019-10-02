class Major
    attr_accessor :name
    
    @@all = []

    def initialize
        @name = name
        @@all << self
    end

end