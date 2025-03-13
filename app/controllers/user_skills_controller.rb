class UserSkillsController < ApplicationController

  def index
    @users = User.all
    # @user_skills = UserSkill.all
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
  end
end
