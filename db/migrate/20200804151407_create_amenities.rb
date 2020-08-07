class CreateAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :amenities do |t|
      t.string :label
      t.string :icon_name

      t.timestamps
    end
    add_index :amenities, :label, unique: true
  end
end
