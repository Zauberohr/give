class Request < ApplicationRecord
  belongs_to :user
  belongs_to :user_skill
  has_many :messages
  has_many :reviews, dependent: :destroy
end
