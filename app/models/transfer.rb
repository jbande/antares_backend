class Transfer < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ModelsHelper

  belongs_to :taxi
  has_many :descriptions, as: :describable

  def from_region
    Region.find_by id: self.from
  end

  def to_region
    Region.find_by id: self.to
  end

end
