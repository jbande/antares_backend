#require 'helpers/image_helper'

include ImageHelper
class Product < ApplicationRecord

  include Rails.application.routes.url_helpers

  has_many_attached :images
  belongs_to :user
  belongs_to :shop
  has_many :offers
  has_and_belongs_to_many :categories

  def update_on_changes(**args)
    attrs = {}    
    args.each do |key, val|
      attrs[key] = val if val
    end
    self.update_attributes(attrs) 	
  end

  def images_urls
    images = []
    self.images.each do |img|
      new_type = ImageLoader.new(img)
      images.append(new_type)
    end
    return images
  end

end
