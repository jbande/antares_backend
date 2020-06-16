module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :original, String, null: false
    field :v100_100, String, null: false
  end
end
