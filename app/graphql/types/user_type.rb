module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: true
    field :email, String, null: false
    field :products, [Types::ProductType], null: false
    field :offers, [Types::OfferType], null: false

    field :tours, [Types::TourType], null: false
  end
end
