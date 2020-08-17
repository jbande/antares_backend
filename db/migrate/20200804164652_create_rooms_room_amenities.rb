class CreateRoomsRoomAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms_room_amenities do |t|
      t.references :room, null: false, foreign_key: true
      t.references :room_amenity, null: false, foreign_key: true
    end
  end
end
