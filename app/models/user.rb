class User < ApplicationRecord
  has_secure_password
  has_one :wishlist, dependent: :destroy

  validates :email, uniqueness: true
  validates :password, :name, presence: true
end
