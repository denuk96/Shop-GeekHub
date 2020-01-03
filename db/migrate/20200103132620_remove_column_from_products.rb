class RemoveColumnFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :cached_weighted_average
  end
end
