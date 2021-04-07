class MenuItemsController < ApplicationController
  before_action :is_user_owner, except: [:index]

  def index
    @menu_items = MenuItem.all()
    @menu_categories = MenuCategorie.all()
    render "index"
  end

  def create
    new_menu_item = MenuItem.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      menu_categorie_id: params[:menu_categorie_id]
    )

    if new_menu_item.save
      flash[:success] = "Menu item added."
    else
      flash[:error] = new_menu_item.errors.full_messages.join(", ")
    end

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

    if menu_item.save
      flash[:success] = "Menu item updated."
    else
      flash[:error] = menu_item.errors.full_messages.join(", ")
    end

    redirect_to edit_menu_item_path(id)
    # redirect_to menu_items_path
  end
end
