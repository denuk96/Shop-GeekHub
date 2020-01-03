class AddCachedCommentsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :cached_comments_total, :integer, :default => 0
    add_column :products, :cached_weighted_average, :float, :default => 0.0
  end
end
