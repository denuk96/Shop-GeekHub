class ChangeProductsCollumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :images, :image
    add_column :products, :images, :string, array: true, default: []
    remove_column :products, :image
  end
end
