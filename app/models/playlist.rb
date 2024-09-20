class Playlist < ApplicationRecord
  has_many :songs
  belongs_to :collection
  belongs_to :song
end
