class AddOrderIdToOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :orderd_products, :order_id, :integer
  end
end
