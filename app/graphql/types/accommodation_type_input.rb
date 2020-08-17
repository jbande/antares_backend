module Types
  class AccommodationTypeInput < BaseInputObject
    argument :name, String, required: true
    argument :price, Float, required: false
    argument :status, Int, required: false
    argument :relevance, Int, required: false
    argument :banned, Boolean, required: false
    argument :latitude, Float, required: false
    argument :longitude, Float, required: false
    argument :address, String, required: false
  end
end