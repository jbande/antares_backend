class AddNotificationTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notification_token, :string
  end
end
