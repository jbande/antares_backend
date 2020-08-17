class CorrectTourDaysFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :tour_days, :day_title, :tittle
    remove_column :tour_days, :description, :string
  end
end
