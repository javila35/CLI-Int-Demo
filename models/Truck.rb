class Truck
    def initialize(name, location)
        @name = name
        @location = location
    end

    def info
        puts "#{@name} located at #{@location}"
    end
end