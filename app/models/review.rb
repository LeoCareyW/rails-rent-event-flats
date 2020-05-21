class Review < ApplicationRecord
  belongs_to :flat

  validates :content, presence: true
  validates :rating, presence: true
end
