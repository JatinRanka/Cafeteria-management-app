class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  attribute :is_delivered, :boolean, default: false

  def self.of_user(user)
    if (user.role == "owner" or user.role == "clerk")
      return Order.all
    else
      return Order.all.where(user_id: user.id)
    end

  end

end
