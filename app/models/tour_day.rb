class TourDay < ApplicationRecord
  has_one_attached :portrait
  belongs_to :tour
  has_many :descriptions, as: :describable
  #has_many_attached :images

  def portrait_urls
    new_type = nil
    if self.portrait.attached?
      new_type = ImageLoader.new(self.portrait.attachment)
    end
    new_type
  end

end
