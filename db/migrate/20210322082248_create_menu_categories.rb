class CreateMenuCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_categories do |t|
      t.string :name
    end
  end
end
