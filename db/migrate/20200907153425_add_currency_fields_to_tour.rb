class AddCurrencyFieldsToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :paid_tour, :boolean, default: true
    add_column :tours, :currency, :string
    add_column :tours, :hours_tour, :boolean, default: true
    add_column :tours, :hours_range, :string
  end
end
