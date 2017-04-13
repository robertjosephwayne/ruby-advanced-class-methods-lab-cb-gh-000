class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    properties_from_filename = filename.split(" - ")
    new_song = self.new
    new_song.name = properties_from_filename[1].gsub(".mp3","")
    new_song.artist_name = properties_from_filename[0]
    new_song
  end

  def self.create_from_filename(filename)
    properties_from_filename = filename.split(" - ")
    new_song = self.new
    new_song.name = properties_from_filename[1].gsub(".mp3","")
    new_song.artist_name = properties_from_filename[0]
    self.all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
