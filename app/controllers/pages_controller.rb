class PagesController < ApplicationController
  # Disable authentication check for the home action
  # skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :authenticate_user!

  # def home
  #   @user = current_user
  #   naakul = User.find_by_email("naakul@lewagon.com")
  #   bilal = User.find_by_email("bilal@lewagon.com")
  #   @user_skills = UserSkill.where.not(user: [naakul, bilal]).uniq { |user_skill| user_skill.skill_id }.uniq { |user_skill| user_skill.user_id }.sample(10)
  #   @skills = Skill.all.sample(10)


  # end
  
  def home
    @user = current_user
  end

  def dashboard
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def search
  end
end
