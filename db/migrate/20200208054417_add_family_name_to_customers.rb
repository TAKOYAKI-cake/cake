class AddFamilyNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :family_name, :string
  end
end
