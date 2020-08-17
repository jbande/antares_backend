class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.string :duration_unit
      t.integer :status
      t.integer :price_adults
      t.integer :price_kids

      t.timestamps
    end
  end
end
