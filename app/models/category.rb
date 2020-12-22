class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_and_belongs_to_many :offers
  belongs_to :shop
  include ModelsHelper
end
