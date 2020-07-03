module Types
  class RegionTypeInput < BaseInputObject
    argument :id, ID, required: false
    argument :country_code, String, required: true
    argument :name, String, required: true
    argument :latitude, String, required: false
    argument :longitude, String, required: false
  end
end