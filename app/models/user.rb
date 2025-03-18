class User < ApplicationRecord
  before_create :add_credit
  has_many :user_skills
  has_many :skills, through: :user_skills, source: :skill
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :skills, through: :user_skills
  has_one_attached :photo
  has_many :requests
  has_many :requests_as_giver, through: :user_skills, source: :requests
  has_many :reviews, through: :requests

  private

  def add_credit
    self.balance = 100
  end
  
end
