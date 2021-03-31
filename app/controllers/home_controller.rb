class HomeController < ApplicationController
  def index
    menu_categories = MenuCategorie.where(is_active: true)
    @menu_items = []

    menu_categories.each {
      |menu_categorie|
      @menu_items.concat(menu_categorie.menu_items)
    }

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
