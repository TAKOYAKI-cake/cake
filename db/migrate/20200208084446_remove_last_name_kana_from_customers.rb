class RemoveLastNameKanaFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :last_name_kanae, :string
  end
end
