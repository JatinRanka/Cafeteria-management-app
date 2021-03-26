class RemoveMenuItemsFromCarts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :carts, :menu_item, foreign_key: true
  end
end
