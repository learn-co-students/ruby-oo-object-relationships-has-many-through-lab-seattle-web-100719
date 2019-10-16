require 'pry'
class Genre

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.genre == self}
    end

    def artists
        arr = []
        Song.all.each do |song|
            if song.genre == self
                arr << song.artist
            end
        end
        arr
    end



end