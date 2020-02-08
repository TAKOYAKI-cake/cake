class AddFamilyNameKanaToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :family_name_kanae, :string
  end
end
