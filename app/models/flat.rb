class Flat < ApplicationRecord
  has_many_attached :photos
  validates :photos, :name, :address, :price, presence: true
  belongs_to :user
  has_many :bookings
end
