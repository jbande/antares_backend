include ImageHelper
class Taxi < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ModelsHelper

  belongs_to :user
  has_many :descriptions, as: :describable
  has_many :transfers
  has_many_attached :images
  has_one_attached :main_image

  has_and_belongs_to_many :taxi_amenities, join_table: :taxis_taxi_amenities

  def images_urls
    images = []
    self.images.each do |img|
      new_type = ImageLoader.new(img)
      images.append(new_type)
    end
    return images
  end

end
