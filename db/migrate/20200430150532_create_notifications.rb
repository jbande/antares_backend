class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :inspector, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.string :signature
      t.string :source_name
      t.string :source_url
      t.integer :relevance
      t.integer :type

      t.timestamps
    end
  end
end
