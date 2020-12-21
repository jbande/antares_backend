class AddBedsFieldsToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :double_beds, :integer
    add_column :rooms, :single_beds, :integer
    add_column :rooms, :bunked_beds, :integer
    add_column :rooms, :baby_beds, :integer
  end
end
