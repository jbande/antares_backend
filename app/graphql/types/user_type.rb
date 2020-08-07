module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: true
    field :email, String, null: false

    #field :static_image, [Types::ProductType], null: false

    field :avatar, ImageType, null: true, method: :avatar_urls

    field :offers, [Types::OfferType], null: false

    field :tours, [Types::TourType], null: false
  end
end
