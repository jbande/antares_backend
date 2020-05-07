module Types
  class TourDayTypeInput < BaseInputObject
    argument :description, String, required: false
    argument :day_title, String, required: false
    argument :day_number, Int, required: false
  end
end