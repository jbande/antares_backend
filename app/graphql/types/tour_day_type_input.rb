module Types
  class TourDayTypeInput < BaseInputObject
    argument :tittle, String, required: false
    argument :day_number, Int, required: false
    argument :descriptions, [Types::DescriptionTypeInput], required: true
  end
end