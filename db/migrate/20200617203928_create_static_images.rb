class CreateStaticImages < ActiveRecord::Migration[6.0]
  def change
    create_table :static_images do |t|
      t.string :page_position

      t.timestamps
    end
  end
end
