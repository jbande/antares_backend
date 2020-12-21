class AddPricesToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :high_season_price, :decimal, precision: 10, scale: 2, default: nil
    add_column :rooms, :low_season_price, :decimal, precision: 10, scale: 2, default: nil
  end
end
