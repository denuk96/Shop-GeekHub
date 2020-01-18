class AddCommentToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :admin_comment, :string
  end
end
