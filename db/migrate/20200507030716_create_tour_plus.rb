class CreateTourPlus < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_plus do |t|
      t.references :tour, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
