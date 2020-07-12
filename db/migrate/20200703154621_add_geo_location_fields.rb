class AddGeoLocationFields < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :latitude, :decimal, precision: 10, scale: 6
    add_column :attractions, :longitude, :decimal, precision: 10, scale: 6
    add_index :attractions, [:latitude, :longitude]

    add_column :accommodations, :latitude, :decimal, precision: 10, scale: 6
    add_column :accommodations, :longitude, :decimal, precision: 10, scale: 6
    add_index :accommodations, [:latitude, :longitude]

    add_column :tours, :latitude, :decimal, precision: 10, scale: 6
    add_column :tours, :longitude, :decimal, precision: 10, scale: 6
    add_index :tours, [:latitude, :longitude]


    add_column :taxis, :latitude, :decimal, precision: 10, scale: 6
    add_column :taxis, :longitude, :decimal, precision: 10, scale: 6
    add_index :taxis, [:latitude, :longitude]

  end
end
