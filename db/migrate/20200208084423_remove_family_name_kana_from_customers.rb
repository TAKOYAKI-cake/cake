class RemoveFamilyNameKanaFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :family_name_kanae, :string
  end
end
