module Types
  class NotificationType < Types::BaseObject
    field :id, ID, null: false
    field :status, Integer, null: false
    field :type, Integer, null: false
    field :relevance, Integer, null: false
    field :signature, String, null: false
    field :source_name, String, null: false
    field :source_url, String, null: false
    field :created_at, String, null: false
    field :inspector, Types::InspectorType, null: true
    field :user, Types::UserType, null: true
  end
end
