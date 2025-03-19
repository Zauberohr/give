class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :requests, dependent: :destroy
  has_many :reviews, through: :request
  validates :skill_id, uniqueness: { scope: :user_id}
end
