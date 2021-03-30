class HomeController < ApplicationController
  def index
    @menu_items = MenuItem.all()
    @cart_items = []
    @total_amount = 0

    cart = Cart.of_user(@current_user)
    if cart
      @cart_items = cart.cart_items
      @total_amount = cart.cart_items.sum(:amount)
    end

    render "index"
  end
end
