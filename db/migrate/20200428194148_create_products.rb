class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :static_image do |t|
      t.string :name
      t.text :description
      t.string :maker
      t.string :brand
      t.string :model
      t.integer :stock
      t.references :user, fereign_key:true
      t.date :expiry_date
      t.date :produced_date

      t.timestamps
    end
  end
end
