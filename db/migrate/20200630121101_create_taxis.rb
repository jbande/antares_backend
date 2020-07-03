class CreateTaxis < ActiveRecord::Migration[6.0]
  def change
    create_table :taxis do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :brand
      t.string :model
      t.string :year_built
      t.integer :passengers_count

      t.decimal :hour_price, precision: 10, scale: 2, default: nil
      t.decimal :day_price, precision: 10, scale: 2, default: nil
      t.decimal :hour_price_wo_driver, precision: 10, scale: 2, default: nil
      t.decimal :day_price_wo_driver, precision: 10, scale: 2, default: nil

      t.timestamps
    end
  end
end
