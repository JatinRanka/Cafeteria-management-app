class MenuItem < ApplicationRecord
  belongs_to :menu_categorie

  #Return the corresponding cart_item for a particular menu_item_id
  def fetch_cart_item(current_user)
    user_cart = Cart.find_by(user_id: current_user.id)

    if user_cart
      cart_item = CartItem.find_by(cart_id: user_cart.id, menu_item_id: id)
      if cart_item
        return cart_item
      end
    end

    return false
  end
end
