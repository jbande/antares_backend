class CreateAccommodationsAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodations_amenities do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true
    end
  end
end
