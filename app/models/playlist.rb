class Playlist < ApplicationRecord
  belongs_to :collection
  belongs_to :song
end
