module Types
  class RoomType < Types::BaseObject
    field :id, ID, null: false
    field :price, Float, null: true
    field :room_number, Integer, null: true
    field :descriptions, [Types::DescriptionType], null: true
    field :images, [Types::ImageType], null: true, method: :images_urls
    field :accommodation, Types::AccommodationType, null: true
    field :room_amenities, [Types::RoomAmenityType], null: true
  end
end
