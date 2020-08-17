module Types
  class TransferType < Types::BaseObject
    field :id, ID, null: false
    field :from, Types::RegionType, null: true, method: :from_region
    field :to, Types::RegionType, null: true, method: :to_region
    field :adult_price, Float, null: true
    field :child_price, Float, null: true
  end
end