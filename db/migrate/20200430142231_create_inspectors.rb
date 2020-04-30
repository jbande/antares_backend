class CreateInspectors < ActiveRecord::Migration[6.0]
  def change
    create_table :inspectors do |t|
      t.string :terms
      t.integer :priority
      t.date :expiry_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
