class ChangeCategoryProductsToCategoriesProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :category_products, :categories_products
  end
end
