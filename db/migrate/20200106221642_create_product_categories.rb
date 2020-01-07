class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.belongs_to :product
      t.belongs_to :category

      t.timestamps
    end

    change_column :products, :category_id, :bigint, :null => true

  end

end
