class Flat < ApplicationRecord
  has_many_attached :photos
  validates :photos, :name, :address, :price, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
