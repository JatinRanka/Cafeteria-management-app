class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.string :menu_item_name
      t.integer :menu_item_price
      t.integer :quantity
      t.references :menu_item, foreign_key: true
    end
  end
end
