class AccomExtra < ApplicationRecord
  has_and_belongs_to_many :accommodations, join_table: :accommodations_accom_extras
end
