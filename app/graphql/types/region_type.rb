module Types
  class RegionType < Types::BaseObject
    field :id, ID, null: false
    field :country_code, String, null: false
    field :name, String, null: false
    field :latitude, String, null: true
    field :longitude, String, null: true
  end
end