module Types
  class AccommodationTypeInput < BaseInputObject
    argument :name, String, required: true
    argument :price, Float, required: false
    argument :high_season_price, Float, required: true
    argument :low_season_price, Float, required: true
    argument :status, Int, required: false
    argument :rent_mode, Int, required: true
    argument :relevance, Int, required: false
    argument :banned, Boolean, required: false
    argument :latitude, Float, required: false
    argument :longitude, Float, required: false
    argument :address, String, required: false
  end
end