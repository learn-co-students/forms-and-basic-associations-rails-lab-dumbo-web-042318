class SongsController < ApplicationController
  before_action :find_song, only:[:destroy, :update, :edit, :show]
  before_action :set_songs, only:[:index]
  def index

  end

  def show

  end

  def new
    @artists = Artist.all
    @song = Song.new
  end

  def create
    # byebug
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
  end

  def update

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private
  def find_song
    @song = Song.find(params[:id])
  end
  def set_songs
    @songs = Song.all
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end
end
