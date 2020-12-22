class Shop < ApplicationRecord
  has_many :static_texts
  has_many :static_images
  has_many :products
  has_many :offers
  has_many :categories
  belongs_to :user
end
