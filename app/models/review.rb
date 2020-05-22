class Review < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :content, length: { minimum: 20 }
  validates :rating, presence: true
end
