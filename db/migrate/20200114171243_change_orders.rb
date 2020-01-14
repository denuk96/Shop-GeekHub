class ChangeOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :status, :string, default: 'new'
    add_column :orders, :total_price, :float
  end
end
