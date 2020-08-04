# Chunks are arrays of 10 food trucks.

class Chunks
    @@all = [ ]

    def self.add(array)
        @@all << array
    end

    def self.all
        @@all
    end

    def self.showChunk(index)
        @@all[index]
    end

    def self.convert(object)
        Truck.new(object['applicant'], object['location']).info
    end
end