class SongsController < ApplicationController
  before_action :set_song, only: [:update, :destroy]
  
  def create
    song = Song.new(song_params)
    if song.persisted?
      render json: {error: song.errors.full_messages}, status: :not_acceptable
    else
      song.save!
      render json: {message: 'Song has been created',Song: song}, status: :ok
    end
  end

  def update
    if @song.update(song_params)
      render json: {message: 'song updated',song: @song}, status: :ok
    else
      render json: {message: 'No record found'}, status: :not_found
    end
  end

  def destroy
    if @song.destroy
      render json: {message: 'Song deleted'}, status: :ok
    else
      render json:{erorr: @song.errors.full_messages}, status: :not_found
    end
  end

  private
  
  def song_params
    params.require(:song).permit(:title,:genre,:release_date,:artist_id,:lyrics,:time_duration)
  end

  def set_song
    @song = Song.find_by(id: params[:song][:id])
  end
end
