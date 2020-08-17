class Description < ApplicationRecord
  include ModelsHelper

  belongs_to :describable, polymorphic: true
end
