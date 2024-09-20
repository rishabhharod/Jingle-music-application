class WishlistsController < ApplicationController
  def create
    wishlist = @current_user.create_wishlist(name: 'Likes')
  end

  def index
    user_playlist = @current_user.wishlist.user_playlists
  end

  # private
  # def wishlist_params
  #   params.require(:wishlist).permit(:name)
  # end
end
