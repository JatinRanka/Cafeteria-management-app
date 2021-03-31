class RemoveIsActiveFromMenuCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :menu_categories, :isActive, :boolean
  end
end
