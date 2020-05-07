module Types
  class TourDayType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: false
    field :day_title, String, null: true
    field :day_number, Integer, null: false
    field :tour, Types::TourType, null: true
  end
end
