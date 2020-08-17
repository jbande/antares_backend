module Types
  class TourDayType < Types::BaseObject
    field :id, ID, null: false
    field :descriptions, [Types::DescriptionType], null: false
    field :tittle, String, null: true
    field :day_number, Integer, null: false
    field :tour, Types::TourType, null: true
    field :portrait, ImageType, null: true, method: :portrait_urls
  end
end
