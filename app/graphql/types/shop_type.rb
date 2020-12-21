module Types
  class ShopType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :uid, String, null: true
  end
end