class ChangeOfferProductsToCategoriesProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :category_offers, :categories_offers
  end
end
