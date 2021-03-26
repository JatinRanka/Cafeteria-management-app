class AddRefToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :user, foreign_key: true
    add_reference :carts, :menu_item, foreign_key: true
  end
end
