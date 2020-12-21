class RemoveTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :accommodations_accom_extras
    drop_table :accom_extras
  end
end
