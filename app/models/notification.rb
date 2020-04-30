class Notification < ApplicationRecord
  belongs_to :inspector
  belongs_to :user
end
