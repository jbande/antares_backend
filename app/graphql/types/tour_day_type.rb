module Types
  class TourDayType < Types::BaseObject
    field :id, ID, null: false
    field :descriptions, [Types::DescriptionType], null: false
    field :tittle, String, null: true
    field :day_number, Integer, null: false
    field :tour, Types::TourType, null: true
  end
end
