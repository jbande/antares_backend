class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :product
  has_and_belongs_to_many :categories

  def update_on_changes(**args)
    attrs = {}
    args.each do |key, val|
      attrs[key] = val if val
    end
    self.update_attributes(attrs)
  end
end
