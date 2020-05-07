class CreateTourDays < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_days do |t|
      t.references :tour, null: false, foreign_key: true
      t.text :description
      t.integer :day_number
      t.string :day_title

      t.timestamps
    end
  end
end
