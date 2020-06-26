class TourDay < ApplicationRecord
  has_one_attached :portrait
  belongs_to :tour
  has_many :descriptions, as: :describable
  has_many_attached :images
end
