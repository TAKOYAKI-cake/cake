class AddFamilyNameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :family_name_kana, :string
  end
end
