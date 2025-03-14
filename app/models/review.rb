class Review < ApplicationRecord
  belongs_to :request
  has_one :user, through: :request
end
