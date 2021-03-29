class HomeController < ApplicationController
  def index
    @menu_items = MenuItem.all()
    @cart_items = []

    cart = Cart.of_user(@current_user)
    if cart
      @cart_items = cart.cart_items
    end

    render "index"
  end
end
