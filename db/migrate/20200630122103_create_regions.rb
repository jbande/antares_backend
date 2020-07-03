class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :country_code
      t.string :name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
