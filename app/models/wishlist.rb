class Wishlist < ApplicationRecord
  has_many :user_playlists
  belongs_to :user
end
