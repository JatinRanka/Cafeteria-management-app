class CartController < ApplicationController
  def index
    @cart_items = []

    cart = Cart.find_by(user_id: @current_user.id)
    if cart
      @cart_items = cart.cart_items
    end

    render "index"
  end

  def create
  end
end
