class User < ApplicationRecord
  has_one_attached :avatar

  include Rails.application.routes.url_helpers

  has_secure_password
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :products
  has_many :offers
  has_many :inspectors
  has_many :notifications
  has_many :tours
  has_many :accommodations
  has_many :taxis
  has_many :attractions

  def avatar_urls
    new_type = nil
    if self.avatar.attached?
      new_type = ImageLoader.new(self.avatar.attachment)
    end
    new_type
  end

end
