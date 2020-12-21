class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :uid, limit: 64, unique: true

      t.timestamps
    end
    add_index :shops, [:uid], unique: true
  end
end
