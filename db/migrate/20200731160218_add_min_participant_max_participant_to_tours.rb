class AddMinParticipantMaxParticipantToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :min_participant, :integer, default: 1
    add_column :tours, :max_participant, :integer
  end
end
