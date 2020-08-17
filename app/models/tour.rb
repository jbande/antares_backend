include ImageHelper
class Tour < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ModelsHelper

  has_one_attached :portrait

  has_many_attached :images

  has_one_attached :main_image

  has_many :descriptions, as: :describable

  belongs_to :user

  has_many :tour_days
  has_many :tour_includes
  has_many :tour_excludes
  has_many :tour_plus
  has_many :tour_suplements



  def images_urls
    images = []
    self.images.each do |img|
      new_type = ImageLoader.new(img)
      images.append(new_type)
    end
    return images
  end

  def days_count
    self.tour_days.count()
  end

end
