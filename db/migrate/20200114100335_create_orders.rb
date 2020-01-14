class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :full_name
      t.text :address
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
