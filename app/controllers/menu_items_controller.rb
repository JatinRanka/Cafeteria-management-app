class MenuItemsController < ApplicationController
  before_action :is_user_owner, except: [:index]

  def index
    @menu_items = MenuItem.all()
    @menu_categories = MenuCategorie.all()
    render "index"
  end

  def create
    MenuItem.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      menu_categorie_id: params[:menu_categorie_id]
    )

    redirect_to menu_items_path
  end
end
