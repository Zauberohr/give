class Request < ApplicationRecord
  belongs_to :user
  belongs_to :user_skill
  has_many :messages
  has_one :review
end
