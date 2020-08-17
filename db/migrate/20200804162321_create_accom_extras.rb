class CreateAccomExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :accom_extras do |t|
      t.string :label
      t.string :icon_name

      t.timestamps
    end
  end
end
