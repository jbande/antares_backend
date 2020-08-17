class AddTopicsToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :topics, :string, array: true
  end
end
