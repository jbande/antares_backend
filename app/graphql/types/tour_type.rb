module Types
  class TourType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :start_date, String, null: true
    field :end_date, String, null: true
    field :duration, Integer, null: true
    field :duration_unit, String, null: true
    field :status, Integer, null: true
    field :prince_adults, Integer, null: true
    field :price_kids, Integer, null: true

    field :tour_includes, [Types::TourIncludesType], null: true
    field :tour_excludes, [Types::TourExcludesType], null: true
    field :tour_suplements, [Types::TourSuplementType], null: true
    field :tour_plus, [Types::TourPlusType], null: true
    field :tour_days, [Types::TourDayType], null: true


    field :user, Types::UserType, null: true
  end
end