class Flat < ApplicationRecord
  has_many_attached :photos
  validates :photos, :name, :address, :price, presence: true
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # def available?(from, to)
  #     bookings.where('start_date <= ? AND end_date >= ?', to, from).none?
  # end

  def unavailable_dates
      bookings.pluck(:start_date, :end_date).map do |range|
        { from: range[0], to: range[1] }
      end
    end

end
