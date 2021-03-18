require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(names, artist_names)
  #   @name = names
  #   @artist_name = artist_names
  # end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.create
    me = self.new
    self.all << me
    me
  end
  def self.new_by_name(song_name)
    me = self.new
    me.name = song_name
    me
  end
  def self.create_by_name(song_name)
    me = self.new
    me.name = song_name
    self.all << me
    me
  end
  def self.find_by_name(finding_name)
    self.all.find { | x | x.name == finding_name }
  end
  def self.find_or_create_by_name(song_name)
    
    if self.find_by_name(song_name).nil?
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  def self.alphabetical
    self.all.sort_by {|element| element.name}
  end
  def self.new_from_filename(filename)
    artist = ""
    filename = filename.delete("-").chomp(".mp3").split(" ")
    artist = filename[0]
    
    filename.shift
    me = self.new
    me.artist_name = artist
    me.name = filename.join(" ")
    me
    
  end
  def self.create_from_filename(filename)
    artist = ""
    filename = filename.delete("-").chomp(".mp3").split(" ")
    artist = filename[0]
    
    filename.shift
    me = self.new
    me.artist_name = artist
    me.name = filename.join(" ")
    self.all << me
    me
  end

  def self.destroy_all
    self.all.clear
  end
end
