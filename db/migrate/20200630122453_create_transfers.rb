class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.references :taxi, null: false, foreign_key: true
      t.integer :from
      t.integer :to
      t.decimal :adult_price, precision: 10, scale: 2, default: nil
      t.decimal :child_price, precision: 10, scale: 2, default: nil
      t.timestamps
    end
  end
end
