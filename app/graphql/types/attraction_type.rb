module Types
  class AttractionType < Types::BaseObject

    field :id, ID, null: false
    field :name, String, null: false
    field :features, [Integer], null: true
    field :activities, [Integer], null: true
    field :hash_tags, [String], null: true
    #field :languages, todo: define this

    field :status, Integer, null: true
    field :subdomain_name, String, null: true

    field :descriptions, [Types::DescriptionType], null: true
    field :images, [Types::ImageType], null: true, method: :images_urls

    field :latitude, Float, null:true
    field :longitude, Float, null:true

    #field :main_image, [Type::ImageType], null: true, method: :main_image_urls
    field :user, Types::UserType, null: true

    field :region, Types::RegionType, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :address, String, null: true

    field :attract_types, [Types::AttractTypeType], null: true
    field :attract_activities, [Types::AttractActivityType], null: true
  end
end

