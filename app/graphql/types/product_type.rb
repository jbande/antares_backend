module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :maker, String, null: true
    field :brand, String, null: true
    field :model, String, null: true
    field :stock, Integer, null: true
    field :expiry_date, String, null: true
    field :produced_date, String, null: true
    field :posted_by, UserType, null: true, method: :user
  end
end
