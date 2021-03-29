class CartController < ApplicationController
  def index
    @cart_items = []

    cart = Cart.of_user(@current_user)
    if cart
      @cart_items = cart.cart_items
    end

    render "index"
  end

  def create
  end
end
