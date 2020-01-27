class AddIndextodb < ActiveRecord::Migration[6.0]
  def change
    add_index :products, :created_at
    add_index :products, :price
    add_index :products, :cached_comments_total
  end
end
