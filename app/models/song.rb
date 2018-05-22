class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(content)
    content.each do |cont|
      if cont != '' || nil
        self.notes << Note.find_or_create_by(content: cont)
      end
    end
  end

  def note_contents
    self.notes.map do |n|
      n.content
    end
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name
  end
end
