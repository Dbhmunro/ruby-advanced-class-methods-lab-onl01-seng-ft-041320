require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.all << self.new
    self.all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    self.all << self.new_by_name(name)
    self.all.last
  end
  
  def self.find_by_name (name)
    if ((self.all.select { |song| song.name == name }) != [])
      self.all.select { |song| song.name == name }.last
    end
  end


  def self.find_or_create_by_name(name)
    if ((self.find_by_name(name)) == nil)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0].strip
    name = data[1].delete_suffix(".mp3")
    
    new_song = self.new_by_name(name)
    new_song.artist_name = (artist_name)
    new_song
  end
  
  def self.create_from_filename(filename)
    # binding.pry
    data = filename.split(" - ")
    artist_name = data[0].strip
    name = data[1].delete_suffix(".mp3")

    new_song = self.create_by_name(name)
    new_song.artist_name = (artist_name)
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
  
end

# binding.pry
# 0