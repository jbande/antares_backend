module Types
  class FeatureType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: true
    field :icon_name, String, null: false
  end
end