class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name
      t.text :description
      t.integer :live
      t.integer :order_by

      t.timestamps
    end
  end
end
