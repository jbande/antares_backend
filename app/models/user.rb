class User < ApplicationRecord
  has_one_attached :avatar

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

end
