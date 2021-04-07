class OrdersController < ApplicationController
  before_action :is_user_clerk_or_owner, only: [:update]

  def index
    # @orders = Order.of_user(@current_user)

    if @current_user.role == "owner"
      customer_name = params[:customer_name]
      start_date = params[:start_date]
      end_date = params[:end_date]

      if customer_name
        user = User.find_by(name: customer_name)
        @orders = Order.where(user_id: user.id)
      end

    end

    @orders ||= Order.of_user(@current_user)

    puts "-------out if : #{@orders.to_a.length()}"
    puts @orders.to_a


    # @orders = Order.where(user_id: 1) if params[:customer_name]
    # puts params[:customer_name]

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
        menu_item_id: cart_item.menu_item_id,
        amount: cart_item.amount
      }
    }

    order_items = OrderItem.create!(order_items)

    cart_items.delete_all

    redirect_to orders_path
  end

  def show
    id = params[:id]
    @order = Order.of_user(@current_user).find(id)
    @total_amount = @order.order_items.sum(:amount)

    render "show"
  end

  def update
    id = params[:id]
    is_delivered = params[:is_delivered]

    order = Order.find(id)

    order.is_delivered = is_delivered
    order.save

    flash[:success] = "Updated order id: #{id}"
    redirect_to orders_path
  end

end
