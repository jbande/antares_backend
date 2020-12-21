class AddPricesToAccommodation < ActiveRecord::Migration[6.0]
  def change
    add_column :accommodations, :high_season_price, :decimal, precision: 10, scale: 2, default: nil
    add_column :accommodations, :low_season_price, :decimal, precision: 10, scale: 2, default: nil
  end
end
