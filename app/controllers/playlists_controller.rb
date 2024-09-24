class PlaylistsController < ApplicationController
  def create
    playlist = Playlist.new(playlist_params)
    if playlist.new_record?
      playlist.save
      render json: {message: 'Song added into the playlist', playlist: playlist}, status: :ok
    else
      render json: {error: 'Song was already present'}, status: :already_reported
    end
  end

  def destroy
    playlist = Playlist.find_by(id: params[:playlist][:id])
    if playlist.destroy
      render json: {message: 'Song has been removed from the playlist'}, status: :ok
    else
      render json: {error: playlist.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def playlist_params
    params.require(:playlist).permit(:song_id,:collection_id)
  end
end
