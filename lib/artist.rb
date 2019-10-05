
class Artist
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.find(name) 
           return self.find(name)
        else 
          return self.new(name)
        end
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name }
      end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        self.songs.map {|song| puts song.name}
    end

end