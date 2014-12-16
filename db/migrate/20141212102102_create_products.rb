class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :short_description
      t.string :image
      t.integer :live
      t.integer :hidden
      t.integer :registration_allowed

      t.timestamps
    end
  end
end
