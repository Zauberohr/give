class User < ApplicationRecord
  has_many :user_skills
  has_many :skills, through: :user_skills, source: :skill
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_skills
end
