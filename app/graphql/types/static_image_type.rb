module Types
  class StaticImageType < Types::BaseObject
    field :id, ID, null: false
    field :page_position, String, null: true
    field :images, [ImageType], null: true, method: :images_urls
  end
end
