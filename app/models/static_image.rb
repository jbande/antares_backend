
include ApplicationHelper
class StaticImage < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :image

  def images_urls
    images = []
    unless self.image.blank?
      new_type = Image.new(self.image)
      images.append(new_type)
    end
    return images
  end

end
