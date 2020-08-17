module Types
  class TaxiTypeInput < BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: true
    argument :brand, String, required: false
    argument :model, String, required: false
    argument :passengers_count, Int, required: false
    argument :hour_price, Float, required: false
    argument :day_price, Float, required: false
    argument :hour_price_wo_driver, Float, required: false
    argument :day_price_wo_driver, Float, required: false
  end
end