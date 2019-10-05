class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        splitted_song = filename.split(" - ")
        artist = splitted_song[0]
        song_title = splitted_song[1]
        new_song = Song.new(song_title)
        new_song.artist_name = artist
        new_song
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
      end

end