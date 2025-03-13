class UserSkillsController < ApplicationController

  def index

    @users = User.all
    # @user_skills = UserSkill.all

    # / thats for the logo
    @role = :giver
  end
end
