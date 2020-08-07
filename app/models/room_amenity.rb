class RoomAmenity < ApplicationRecord
  has_and_belongs_to_many :rooms, join_table: :rooms_room_amenities
end
