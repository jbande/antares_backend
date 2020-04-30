class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key:true
      t.references :product, foreign_key:true
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
