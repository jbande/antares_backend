include ImageHelper

class Room < ApplicationRecord

  include Rails.application.routes.url_helpers
  include ModelsHelper

  belongs_to :accommodation
  has_many :descriptions, as: :describable
  has_many_attached :images

  def images_urls
    images = []
    self.images.each do |img|
      new_type = ImageLoader.new(img)
      images.append(new_type)
    end
    return images
  end

end
