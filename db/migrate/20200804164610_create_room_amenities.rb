class CreateRoomAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :room_amenities do |t|
      t.string :label
      t.string :icon_name

      t.timestamps
    end
  end
end
