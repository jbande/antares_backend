module Types
  class OfferType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :start_date, String, null: true
    field :end_date, String, null: true
    field :product, ProductType, null: false
    field :user, UserType, null: false
  end
end
