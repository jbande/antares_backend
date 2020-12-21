module Types
  class RoomType < Types::BaseObject
    field :id, ID, null: false

    field :price, Float, null: true
    field :high_season_price, Float, null: true
    field :low_season_price, Float, null: true

    field :room_number, Integer, null: true

    field :double_beds, Integer, null: true
    field :single_beds, Integer, null: true
    field :bunked_beds, Integer, null: true
    field :baby_beds, Integer, null: true

    field :descriptions, [Types::DescriptionType], null: true
    field :images, [Types::ImageType], null: true, method: :images_urls
    field :accommodation, Types::AccommodationType, null: true
    field :room_amenities, [Types::RoomAmenityType], null: true

  end
end
