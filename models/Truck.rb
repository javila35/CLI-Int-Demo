class Truck
    def initialize(name, location)
        @name = name
        @location = location
    end

    def info
        puts Rainbow("#{@name}").blue + " located at " + Rainbow("#{@location}").green;
    end
end