class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  attribute :status, :string, default: "pending"

  def self.of_user(user)
    return Order.all.where(user_id: user.id)
  end

end
