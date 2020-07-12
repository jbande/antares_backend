class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|

      t.references :user, null: false, foreign_key: true
      t.string :name
      t.timestamps

      t.integer :features, array: true
      t.integer :activities, array: true
      t.string :hash_tags, array: true

      t.json :languages

      t.integer :status, default: 0
      t.boolean :banned, default: false

      t.string :subdomain_name
      t.integer :relevance, default: 0

    end
  end
end
