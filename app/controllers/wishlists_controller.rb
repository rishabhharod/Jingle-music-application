class WishlistsController < ApplicationController
  include SetUser

  before_action :set_user

  def create
    if @current_user.wishlist.present?
      render json: {message: 'Wishlist is existed'}, status: :already_reported
    else
      wishlist = @current_user.create_wishlist(name: 'Likes')
      render json: {message: 'Wishlist created', wishlist_id: wishlist.id}, status: :ok
    end 
  end

  def index
    user_playlists = @current_user.wishlist.user_playlists
    if user_playlists.empty?
      render json: {message: 'Wishlist is empty'}, status: :no_content
    else
      render json: {message: 'Your wishlist', songs: user_playlists}, status: :ok
    end
  end
end
