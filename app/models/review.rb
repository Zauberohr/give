class Review < ApplicationRecord
  belongs_to :request
  has_one :user, through: :request

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
end
