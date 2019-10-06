class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def songs
        Song.all.select do |song| 
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
       found_artist = self.all.find do |artist|
            artist.name = artist_name
        end
        if found_artist
            return found_artist
        else
            created_artist = Artist.new(artist_name)
            return created_artist
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end




end