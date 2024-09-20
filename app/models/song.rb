class Song < ApplicationRecord
  has_many :artists
  belongs_to :artist
end
