class CreateStaticTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :static_texts do |t|
      t.string :text
      t.string :language
      t.string :page_position
      t.timestamps
    end
  end
end
