class AddDefaultMakingStatusToOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :orderd_products, :making_status, :integer, :default => 0

  end
end
