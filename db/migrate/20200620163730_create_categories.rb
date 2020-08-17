class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :parent_category_id
      t.string :name
      t.string :page_position

      t.timestamps
    end
  end
end
