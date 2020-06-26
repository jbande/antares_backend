module Types
  class AccommodationTypeInput < BaseInputObject
    argument :name, String, required: true
    argument :price, Float, required: false
    argument :status, Int, required: false
    argument :relevance, Int, required: false
    argument :banned, Boolean, required: false
  end
end