class AddCategoryToShopReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :shop, index: true
    add_reference :products, :shop, index: true
    add_reference :offers, :shop, index: true
  end
end
