class AllTrucks

    def initialize(array)
        @chunks = []
        @index = 0
        self.convert(array)
        self.none?
    end

    def current
        return @index
    end

    # Convert large JSON response into arrays/chunks of 10.
    def convert(array)
        until array.length == 0
            @chunks << array.sort_by!{ |truck| truck['applicant']}.first(10).map{|truck| truck.slice('applicant', 'location')}.to_a
            array.shift(10)
        end
    end

    def length
        return @chunks.length
    end

    # check if there are more arrays to display.
    def more?
        return @chunks.length > @index
    end

     def next
        current = @chunks[@index]
        @index += 1
        current
    end

    # Check if the array is empty after conversion.
    def none?
        if @chunks.length == 0
            puts "Currently no trucks are open."
        end
    end
end