class Artist
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def genres
        Song.all.select do |song|
            song.artist == self
        end.map do |song|
            song.genre
        end
    end

    def self.all
        @@all
    end
end