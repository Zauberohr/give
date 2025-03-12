class UserSkillsController < ApplicationController

  def index
    @users = User.all
    # @user_skills = UserSkill.all
  end

end
