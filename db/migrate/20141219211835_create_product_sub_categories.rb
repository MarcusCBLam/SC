class CreateProductSubCategories < ActiveRecord::Migration
  def change
    create_table :product_sub_categories do |t|
      t.string :name
      t.text :description
      t.text :product_category_id
      t.integer :live
      t.integer :order_by

      t.timestamps
    end
  end
end
