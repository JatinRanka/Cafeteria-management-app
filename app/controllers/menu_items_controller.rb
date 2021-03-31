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

  def edit
    id = params[:id]
    @menu_item = MenuItem.find(id)
    @menu_categories = MenuCategorie.all
    render "edit"
  end

  def update
    id = params[:id]
    name = params[:name]
    price = params[:price]
    description = params[:description]
    menu_categorie_id = params[:menu_categorie_id]

    menu_item = MenuItem.find(id)
    menu_item.name = name
    menu_item.price = price
    menu_item.description = description
    menu_item.menu_categorie_id = menu_categorie_id
    menu_item.save

    flash[:success] = "Menu item updated."
    redirect_to menu_items_path
  end
end
