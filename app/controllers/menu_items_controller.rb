class MenuItemsController < ApplicationController
  before_action :is_user_owner, except: [:index]

  def index
  end

  def create
    MenuItem.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      menu_categorie_id: params[:menu_categorie_id]
    )

    render plain: "Menu Item created."
  end


end
