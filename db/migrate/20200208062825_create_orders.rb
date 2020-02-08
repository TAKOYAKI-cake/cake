class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

        t.integer :customer_id
        t.integer :total_amount
        t.integer :order_status
        t.string :method_of_payment
        t.string :postcode
        t.string :shipping_address
        t.string :shipping_name
        t.integer :postage

      t.timestamps
    end
  end
end
