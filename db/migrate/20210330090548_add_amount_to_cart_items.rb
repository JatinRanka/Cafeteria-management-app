class AddAmountToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :amount, :integer
  end
end
