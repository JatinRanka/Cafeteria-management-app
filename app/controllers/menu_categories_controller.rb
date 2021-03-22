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

end
