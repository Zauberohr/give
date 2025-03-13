class UserSkillsController < ApplicationController

  def index

    # @users = User.all
    # @user_skills = UserSkill.all
    # / thats for the logo
    @role = :giver
    if params[:search][:query].present?
      @user_skills = UserSkill.joins(:skill).where(skill:{ id: params[:search][:query] })
    end
  end

  def show
    @user_skill = UserSkill.find(params[:id])
  end
end
