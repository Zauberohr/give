class PagesController < ApplicationController
  # Disable authentication check for the home action
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user_skills = UserSkill.all.uniq { |user_skill| user_skill.skill_id }.uniq { |user_skill| user_skill.user_id }.sample(4)
  end

end
