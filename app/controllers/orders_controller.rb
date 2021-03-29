class OrdersController < ApplicationController
  def index
    @orders = Order.of_user(@current_user)
    render "index"
  end

  def create
    order = Order.create!(
      user_id: @current_user.id
    )

    cart = Cart.of_user(@current_user)
    cart_items = cart.cart_items

    order_items = cart_items.map {|cart_item|
      order_item = {
        order_id: order.id,
        menu_item_name: cart_item.menu_item_name,
        menu_item_price: cart_item.menu_item_price,
        quantity: cart_item.quantity,
        menu_item_id: cart_item.menu_item_id
      }
    }

    order_items = OrderItem.create!(order_items)

    cart_items.delete_all

    redirect_to orders_path
  end

  def show
    id = params[:id]
    @order = Order.of_user(@current_user).find(id)

    render "show"
  end

end
