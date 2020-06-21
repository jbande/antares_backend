class CreateCategoryOffer < ActiveRecord::Migration[6.0]
  def change
    create_table :category_offers do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
