class TaxiAmenity < ApplicationRecord
  has_and_belongs_to_many :taxis, join_table: :taxis_taxi_amenities
end
