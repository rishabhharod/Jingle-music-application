class UserPlaylist < ApplicationRecord
  has_many :songs
  belongs_to :song
  belongs_to :wishlist
end
