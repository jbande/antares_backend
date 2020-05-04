class Product < ApplicationRecord
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
end
