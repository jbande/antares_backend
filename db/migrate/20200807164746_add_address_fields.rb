class AddAddressFields < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :address, :string
    add_column :accommodations, :address, :string
  end
end
