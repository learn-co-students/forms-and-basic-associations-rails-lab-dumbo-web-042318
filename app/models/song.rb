class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
     if self.artist != nil
       self.artist.name
     else
       nil
     end
   end

   def artist_name=(name)
     artist = Artist.find_or_create_by(name: name)
     self.artist = artist
   end

   def note_contents
     self.notes.map do |note|
       note.content
     end
   end

   def note_contents=(contents)
     contents.each do |content|
      if !content.strip.blank?
       self.notes << Note.find_or_create_by(content: content)
      end
     end
   end
   def genre_name
     self.genre.name
   end
   def genre_name=(name)
# byebug
    self.genre = Genre.find_by_name(name)
   end
end
