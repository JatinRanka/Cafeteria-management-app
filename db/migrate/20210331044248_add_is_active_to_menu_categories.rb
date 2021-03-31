class AddIsActiveToMenuCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_categories, :is_active, :boolean
  end
end
