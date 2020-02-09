class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_id
      t.integer :sales_status
      t.integer :price

      t.timestamps
    end
  end
end
