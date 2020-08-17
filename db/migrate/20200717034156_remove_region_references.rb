class RemoveRegionReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :tours, :region_id, :integer
    remove_column :taxis, :region_id, :integer
  end
end
