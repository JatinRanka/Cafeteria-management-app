class CartItemsController < ApplicationController

  def index
    begin
      cart = Cart.find_by(user_id: @current_user.id)

      unless cart
        raise "Cart is empty"
      end

      @cart_items = cart.cart_items
      render plain: @cart_items.to_a

    rescue Exception => e
      render plain: e.message

    end
  end

  def create
    cart = Cart.find_by(user_id: @current_user.id)

    # Creates cart for user if it doesn't exist
    unless cart
      cart = Cart.create!(
        user_id: @current_user.id
      )
    end

    menu_item_id = params[:menu_item_id]
    menu_item = MenuItem.find(menu_item_id)

    CartItem.create!(
      menu_item_id: menu_item_id,
      menu_item_name: menu_item.name,
      menu_item_price: menu_item.price,
      quantity: 1,
      cart_id: cart.id
    )

    redirect_to home_path

  end

  def update
    cart_item_id = params[:id]
    update_type = params[:type]

    if update_type == "increment"
      CartItem.find(cart_item_id).increment!(:quantity)
    else # decrement
      cart_item = CartItem.find(cart_item_id).decrement!(:quantity)

      if cart_item.quantity == 0
        cart_item.delete()
      end

    end

    redirect_to home_path

  end
end
