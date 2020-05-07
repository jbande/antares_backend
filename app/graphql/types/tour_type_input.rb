module Types
  class TourTypeInput < BaseInputObject
    argument :title, String, required: true
    argument :description, String, required: true
    argument :start_date, String, required: false
    argument :end_date, String, required: false
    argument :duration, Integer, required: false
    argument :status, Integer, required: false
    argument :price_adults, Integer, required: false
    argument :price_kids, Integer, required: false
  end
end