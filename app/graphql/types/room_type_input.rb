module Types
  class RoomTypeInput < BaseInputObject

    argument :price, Float, required: false
    argument :high_season_price, Float, required: true
    argument :low_season_price, Float, required: true
    argument :room_number, Int, required: true

    argument :double_beds, Int, required: false
    argument :single_beds, Int, required: false
    argument :bunked_beds, Int, required: false
    argument :baby_beds, Int, required: false

    argument :descriptions, [Types::DescriptionTypeInput], required: true
    argument :room_amenities, [Int], required: true
  end
end