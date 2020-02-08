class AddAddressToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :Address, :string
  end
end
