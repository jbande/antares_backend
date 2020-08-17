module Types
  class TourSuplementType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: false
    field :tour, Types::TourType, null: true
  end
end
