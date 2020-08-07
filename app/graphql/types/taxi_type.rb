module Types
  class TaxiType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :user, Types::UserType, null: false
    field :brand, String, null: true
    field :model, String, null: true
    field :passengers_count, Int, null: true
    field :hour_price, Float, null: true
    field :day_price, Float, null: true
    field :hour_price_wo_driver, Float, null: true
    field :day_price_wo_driver, Float, null: true
    field :transfers, [Types::TransferType], null: false
    field :descriptions, [Types::DescriptionType], null: false
    field :images, [ImageType], null: true, method: :images_urls

  end
end