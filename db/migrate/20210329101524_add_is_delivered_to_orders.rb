class AddIsDeliveredToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :is_delivered, :boolean
  end
end
