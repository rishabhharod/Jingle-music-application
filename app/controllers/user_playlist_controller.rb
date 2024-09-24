class UserPlaylistController < ApplicationController
  include SetUser

  before_action :set_user
  before_action :set_wishlist

  def create
    debugger
    user_playlist = @wishlist.user_playlists.find_or_initialize(song_id: params[:song_id])
    if user_playlist.new_record?
      user_playlist.save
      render json: {message: 'Song added to ',wishlist_name: @wishlist.name}, status: :ok
    else
      render json: {message: 'Song has already exist'}, status: :already_reported
    end
  end

  def destroy
    user_playlist = @wishlist.user_playlists.find_by(id: params[:id])
    if user_playlist.destroy
      render json: {message: 'Song removed'}, status: :ok
    else
      render json: {error: user_playlist.errors.full_message}, status: :not_found
    end 
  end

  private

  def set_wishlist  
    @wishlist = @current_user.wishlist || @current_user.create_wishlist(name: 'Likes')
  end 
end
