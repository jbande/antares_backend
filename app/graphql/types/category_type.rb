module Types
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :parent_category_id, Int, null: true
    field :page_position, String, null: true
    field :name, String, null: false
  end
end
