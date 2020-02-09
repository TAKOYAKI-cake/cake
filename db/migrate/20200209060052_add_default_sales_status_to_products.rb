class AddDefaultSalesStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :sales_status, :integer, :default => 0

  end
end
