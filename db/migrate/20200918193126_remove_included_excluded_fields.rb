class RemoveIncludedExcludedFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :accommodations, :includedServices, :integer, array: true, default: []
    remove_column :accommodations, :excludedServices, :integer, array: true, default: []
    add_column :accommodations, :included_services, :integer, array: true, default: []
    add_column :accommodations, :excluded_services, :integer, array: true, default: []
  end
end
