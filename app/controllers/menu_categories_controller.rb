class MenuCategoriesController < ApplicationController
  before_action :is_user_owner, except: [:index]

  def index
    @menu_categories = MenuCategorie.all()
    render "index"
  end

  def create
    MenuCategorie.create!(
      name: params[:name]
    )

    redirect_to menu_categories_path
  end

  def edit
    id = params[:id]
    @menu_categorie = MenuCategorie.find(id)
    render "edit"
  end

  def update
    id = params[:id]
    name = params[:name]

    menu_categorie = MenuCategorie.find(id)
    menu_categorie.name = name
    menu_categorie.save

    flash[:success] = "Menu category updated."
    redirect_to menu_categories_path

  end

end
