class Collection < ApplicationRecord
  has_many :playlists

  validates :title, :description, presence: true
  validates :title, uniqueness:true

  def all_songs(playlists)
    playlists.flat_map(&:song)
  end
end
