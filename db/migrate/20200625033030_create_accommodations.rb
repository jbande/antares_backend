class CreateAccommodations < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodations do |t|

      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :status, default: 0
      t.integer :relevance, default:  0
      t.boolean :banned, default: false
      t.decimal :price, precision: 10, scale: 2, default: nil
      t.integer :main_image_id, default: nil


      t.timestamps
    end
  end
end
