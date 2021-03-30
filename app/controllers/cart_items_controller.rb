class CartItemsController < ApplicationController

  def index
    begin
      cart = Cart.of_user(@current_user)

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
    cart = Cart.of_user(@current_user)

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
      amount: menu_item.price,
      cart_id: cart.id
    )

    redirect_to home_path

  end

  def update
    cart_item_id = params[:id]
    update_type = params[:type]

    if update_type == "increment"
      cart_item = CartItem.find(cart_item_id)
      cart_item.quantity = cart_item.quantity + 1
      cart_item.amount = cart_item.quantity * cart_item.menu_item_price
      cart_item.save

    else # decrement
      cart_item = CartItem.find(cart_item_id)
      cart_item.quantity = cart_item.quantity - 1

      if cart_item.quantity == 0
        cart_item.delete()
      else
        cart_item.amount = cart_item.quantity * cart_item.menu_item_price
        cart_item.save
      end
    end

    redirect_to home_path

  end
end
