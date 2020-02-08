class AddLastNameKanaToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name_kanae, :string
  end
end
