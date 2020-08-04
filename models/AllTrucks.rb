class AllTrucks

    def initialize(array)
        @chunks = [];
        @index = 0;
        self.convert(array);
        self.none?;
    end;

    # Convert large JSON response into arrays/chunks of 10.
    def convert(array)
        until array.length == 0
            @chunks << array.sort_by!{ |truck| truck['applicant']}.first(10).map{|truck| truck.slice('applicant', 'location')}.to_a;
            array.shift(10);
        end;
    end;

    # Loop through chunk and display info.
    def display
        puts Rainbow("Trucks currently open:").green + " page #{@index + 1}/#{@chunks.length}";
        @chunks[@index].each do |truck|
            puts Rainbow("#{truck['applicant']}").blue + " located at " + Rainbow("#{truck['location']}.").green;
        end;
    end;

    # check if there are more arrays to display.
    def more?
        return @chunks.length > @index;
    end;

     # Increment counter to iterate through all chunks.
     def next 
        current = @chunks[@index];
        @index += 1;
        current;
    end;

    # Check if the array is empty after conversion.
    def none?
        if @chunks.length == 0
            puts Rainbow("Currently no trucks are open.").red;
        end;
    end;
end;