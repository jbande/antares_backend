class Room < ApplicationRecord
  belongs_to :accommodation
  has_many :descriptions, as: :describable
  has_many_attached :images
end
