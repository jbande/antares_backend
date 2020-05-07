class Tour < ApplicationRecord

  has_one_attached :portrait

  has_many_attached :images

  belongs_to :user

  has_many :tour_days
  has_many :tour_includes
  has_many :tour_excludes
  has_many :tour_plus
  has_many :tour_suplements



end
