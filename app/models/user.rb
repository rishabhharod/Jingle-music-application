class User < ApplicationRecord
  has_secure_password
  has_one :wishlist, dependenct: :destroy 

  after_create :set_wishlist

  private
  
  def set_wishlist
    self.create_wishlist!
  end
end
