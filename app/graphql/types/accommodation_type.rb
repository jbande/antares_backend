module Types
  class AccommodationType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :status, Integer, null: true
    field :relevance, Integer, null: true
    field :banned, Boolean, null: true
    field :price, Float, null: true
    field :descriptions, [Types::DescriptionType], null: true
    field :images, [Types::ImageType], null: true, method: :images_urls
    #field :main_image, [Type::ImageType], null: true, method: :main_image_urls
    field :user, Types::UserType, null: true
    field :rooms, [Types::RoomType], null: true
    field :region, Types::RegionType, null: true
    field :amenities, [Types::AmenityType], null: true
    field :accom_extras, [Types::AccomExtraType], null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :address, String, null: true
  end
end
