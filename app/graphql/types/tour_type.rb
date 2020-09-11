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
    field :price_adults, Integer, null: true
    field :price_kids, Integer, null: true
    field :hours_tour, Boolean, null: false
    field :paid_tour, Boolean, null: false
    field :currency, String, null: true
    field :hours_range, String, null: true

    field :descriptions, [Types::DescriptionType], null: true

    field :tour_includes, [Types::TourIncludesType], null: true
    field :tour_excludes, [Types::TourExcludesType], null: true
    field :tour_suplements, [Types::TourSuplementType], null: true
    field :tour_plus, [Types::TourPlusType], null: true
    field :tour_days, [Types::TourDayType], null: true

    field :min_participant, Integer, null: false
    field :max_participant, Integer, null: true

    field :images, [ImageType], null: true, method: :images_urls
    field :days_count, Integer, null: true, method: :days_count
    field :user, Types::UserType, null: true

    field :topics, [String], null: true

  end
end
