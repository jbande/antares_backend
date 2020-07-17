include ImageHelper
class Accommodation < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ModelsHelper

  belongs_to :user
  belongs_to :region

  has_many :descriptions, as: :describable
  has_many :rooms
  has_many_attached :images
  has_one_attached :main_image

  def images_urls
    images = []
    self.images.each do |img|
      new_type = ImageLoader.new(img)
      images.append(new_type)
    end
    return images
  end

end
