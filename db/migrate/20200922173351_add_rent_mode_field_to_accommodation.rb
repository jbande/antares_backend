class AddRentModeFieldToAccommodation < ActiveRecord::Migration[6.0]
  def change
    add_column :accommodations, :rent_mode, :integer, default: 0
  end
end
