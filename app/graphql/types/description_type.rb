module Types
  class DescriptionType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :language, String, null: false
  end
end
