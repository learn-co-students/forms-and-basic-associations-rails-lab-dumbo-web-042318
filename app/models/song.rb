class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
 
  def genre_name=(genre_str)
    Genre.find_or_create_by(name: genre_str).songs << self 
  end  

  def genre_name 
    self.genre.name
  end 

  def artist_name=(artist_str)
    Artist.find_or_create_by(name: artist_str).songs << self 
  end  

  def artist_name 
    self.artist.name
  end 

  def note_contents=(new_notes)
    new_notes.each do |note|
       self.notes << Note.create(content: note) if note.length > 0
    end
  end 

  def note_contents 
    self.notes.map {|note| note.content}
  end 
end

