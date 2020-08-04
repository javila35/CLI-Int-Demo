class AllTrucks
    #initialize with big array,
    # run instance methods in initialize to sort alphabetically
    # turn that into array of arrays.


    # create a function that minimizes the large array into smaller arrays.
    def initialize(array)
        @chunks = []
        @pointer = 0;
        until array.length == 0
            array.sort_by!{ |truck| truck['applicant']}.first(10).map{|truck| @chunks << truck.slice('applicant', 'location')};
            array.shift(10)
        end
    end

    # Convert large JSON response into Chunks
    def convert
        until AllTrucks.all.length == 0 do 
            Chunks.add(AllTrucks.all.first(10).to_a);
            AllTrucks.all.shift(10);
        end;
    end;
end;