class Song < ApplicationRecord
  has_many :artists
  belongs_to :artist
  belongs_to :playlist
end
