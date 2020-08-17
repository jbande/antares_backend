class AttractType < ApplicationRecord
  has_and_belongs_to_many :attractions, join_table: :attractions_attract_types

end
