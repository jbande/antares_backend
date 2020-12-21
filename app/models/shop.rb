class Shop < ApplicationRecord
  has_many :static_texts
  has_many :static_images
end
