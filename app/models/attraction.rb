class Attraction < ApplicationRecord
  belongs_to :user
  belongs_to :region

  include Rails.application.routes.url_helpers
  include ModelsHelper

  has_many_attached :images
  has_one_attached :main_image

  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_many :descriptions, as: :describable
  has_and_belongs_to_many :attract_types, join_table: :attractions_attract_types
  has_and_belongs_to_many :attract_activities, join_table: :attractions_attract_activities


  def images_urls
    images = []
    self.images.each do |img|
      new_type = ImageLoader.new(img)
      images.append(new_type)
    end
    return images
  end


end
