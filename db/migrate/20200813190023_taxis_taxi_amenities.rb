class TaxisTaxiAmenities < ActiveRecord::Migration[6.0]
  create_table :taxis_taxi_amenities do |t|
    t.references :taxi, null: false, foreign_key: true
    t.references :taxi_amenity, null: false, foreign_key: true
  end
end
