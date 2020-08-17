class CreateAccommodationsAccomExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodations_accom_extras do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.references :accom_extra, null: false, foreign_key: true
    end
  end
end
