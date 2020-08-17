module Types
  class StaticTextType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :language, String, null: false
    field :page_position, String, null: false
  end
end
