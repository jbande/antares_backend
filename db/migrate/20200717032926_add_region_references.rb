class AddRegionReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :attractions, :region, foreign_key: true
    add_reference :tours, :region, foreign_key: true
    add_reference :accommodations, :region, foreign_key: true
    add_reference :taxis, :region, foreign_key: true
  end
end
