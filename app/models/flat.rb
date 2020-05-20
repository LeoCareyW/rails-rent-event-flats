class Flat < ApplicationRecord
  has_many_attached :photos
  validates :photos, presence: true
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
