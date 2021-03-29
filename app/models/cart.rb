class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def self.of_user(user)
    return Cart.find_by(user_id: user.id)
  end
end
