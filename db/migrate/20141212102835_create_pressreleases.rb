class CreatePressreleases < ActiveRecord::Migration
  def change
    create_table :pressreleases do |t|
      t.string :title
      t.text :description
      t.string :image
      t.date :date
      t.integer :live

      t.timestamps
    end
  end
end
