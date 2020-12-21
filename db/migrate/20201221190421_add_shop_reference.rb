class AddShopReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :static_texts, :shop, index: true
    add_reference :static_images, :shop, index: true
  end
end
