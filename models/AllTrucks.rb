# AllTrucks is where I store the sorted and filtered JSON file of all open food trucks.
class AllTrucks
    @@all = [];

    def self.all
        @@all;
    end;

    def self.add(array)
        @@all << array;
    end;

    # Convert large JSON response into Chunks
    def self.convert
        until AllTrucks.all.length == 0 do 
            Chunks.add(AllTrucks.all.first(10).to_a);
            AllTrucks.all.shift(10);
        end;
    end;
end;