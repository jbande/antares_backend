module Types
  class RoomTypeInput < BaseInputObject
    argument :price, Float, required: false
    argument :room_number, Int, required: true
  end
end