class SongsController < ApplicationController
  def create
    song = User.new(song_params)
    if song.save
      render json: {message: 'Song has been created',Song: song}, status: :ok
    else
      render json: {error: song.errors.full_messages}, status: :not_acceptable
    end
  end

  def destroy
    song = Song.find_by(id: params[:id])
    if song.destroy
      render json: {message: 'Song deleted'}, status: :ok
    else
      render json:{message: song.errors.full_messages}, status: :not_found
    end
  end

  private
  
  def song_params
    params.require(:songs).permit(:title,:genre,:release_date,:artist_id,:lyrics,:Time_duration)
  end
end
