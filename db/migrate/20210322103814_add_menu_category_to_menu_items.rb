class AddMenuCategoryToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :menu_items, :menu_categorie, foreign_key: true
  end
end
