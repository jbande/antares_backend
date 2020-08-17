class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.text :text
      t.references :describable, polymorphic: true, null: false
      t.string :language

      t.timestamps
    end
  end
end
