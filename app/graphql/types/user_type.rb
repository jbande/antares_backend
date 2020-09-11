module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: false
    field :preferred_language, String, null: true

    #field :static_image, [Types::ProductType], null: false

    field :avatar, ImageType, null: true, method: :avatar_urls

    field :offers, [Types::OfferType], null: false

    field :tours, [Types::TourType], null: false
    field :accommodations, [Types::AccommodationType], null: false
    field :taxis, [Types::TaxiType], null: false
    field :attractions, [Types::AttractionType], null: false
  end
end
