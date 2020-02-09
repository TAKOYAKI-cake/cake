class RemoveAddressFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :Address, :string
  end
end
