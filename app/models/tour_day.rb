class TourDay < ApplicationRecord
  has_one_attached :portrait

  belongs_to :tour
end
