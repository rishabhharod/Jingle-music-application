class Artist < ApplicationRecord
    has_many :songs 

    validates :name, :genre, :biography, presence: true
end
