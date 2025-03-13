class UserSkillsController < ApplicationController

  def index

    @users = User.all
    # @user_skills = UserSkill.all
    # / thats for the logo
    @role = :giver
    @user_skills = UserSkill.all
    if params[:query].present?
      @user_skills = UserSkill.joins(:skill).where(skill:{ name: params[:query].capitalize })
    end
  end

  def show
    @user_skill = UserSkill.find(params[:id])
  end
end
