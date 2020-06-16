#require 'helpers/image_helper'

include ApplicationHelper
class Product < ApplicationRecord

  include Rails.application.routes.url_helpers

  has_many_attached :images
  belongs_to :user
  has_many :offers

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

      new_type = Image.new(img)

      images.append(new_type)

    end

    return images
  end

end
