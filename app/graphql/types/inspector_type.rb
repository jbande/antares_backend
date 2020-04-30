module Types
  class InspectorType < Types::BaseObject
    field :id, ID, null: false
    field :terms, String, null: false
    field :priority, Integer, null: false
    field :expiry_date, String, null: true
    field :created_at, String, null: false
    field :user, UserType, null: true
    field :notification, NotificationType, null: true
  end
end
