class AddBedsFieldsToAccommodation < ActiveRecord::Migration[6.0]
  def change
    add_column :accommodations, :double_beds, :integer, default: 0
    add_column :accommodations, :single_beds, :integer, default: 0
    add_column :accommodations, :bunked_beds, :integer, default: 0
    add_column :accommodations, :baby_beds, :integer, default: 0
  end
end
