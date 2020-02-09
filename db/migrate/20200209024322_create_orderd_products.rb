class CreateOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orderd_products do |t|
      t.integer :quantity
      t.integer :price
      t.integer :making_status

      t.timestamps
    end
  end
end
