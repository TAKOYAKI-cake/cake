class AddProductIdToOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :orderd_products, :product_id, :integer
  end
end
