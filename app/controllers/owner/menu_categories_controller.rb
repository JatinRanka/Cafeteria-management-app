module Owner

  class MenuCategoriesController < ApplicationController
    before_action :is_user_owner

    def index
      @menu_categories = MenuCategorie.all()
      render "index"
    end

    def create
      MenuCategorie.create!(
        name: params[:name]
      )

      redirect_to owner_menu_categories_path
    end

  end
end
