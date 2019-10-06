class MP3Importer
    attr_accessor :path

    @@all = []

    def initialize(path)
        @path = path
        @@all << self
    end

    def self.all
        @@all
    end

    def files
        Dir.glob("#{path}/*.mp3").collect do |file| 
        file.gsub("#{path}/", "") 
        end
    end

    def import
        files.each do |filename|
            Song.new_by_filename(filename)
        end
    end

end