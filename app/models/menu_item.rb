class MenuItem < ApplicationRecord
  belongs_to :menu_categorie

  def is_present_in_cart?(current_user)
    user_cart = Cart.find_by(user_id: current_user.id)

    if user_cart
      if CartItem.find_by(cart_id: user_cart.id, menu_item_id: id)
        return true
      end
    end

    return false
  end
end
