class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.integer :room_number, default: 0
      t.decimal :price, precision: 10, scale: 2, default: nil

      t.timestamps
    end
  end
end
