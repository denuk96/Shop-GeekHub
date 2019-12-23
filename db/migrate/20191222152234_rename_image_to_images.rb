class RenameImageToImages < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :image, :images
  end
end
