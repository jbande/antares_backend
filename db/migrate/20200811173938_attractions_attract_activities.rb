class AttractionsAttractActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions_attract_activities do |t|
      t.references :attraction, null: false, foreign_key: true
      t.references :attract_activity, null: false, foreign_key: true
    end
  end
end
