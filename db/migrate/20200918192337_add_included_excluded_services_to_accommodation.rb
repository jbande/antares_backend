class AddIncludedExcludedServicesToAccommodation < ActiveRecord::Migration[6.0]
  def change
    add_column :accommodations, :includedServices, :integer, array: true, default: []
    add_column :accommodations, :excludedServices, :integer, array: true, default: []
  end
end
