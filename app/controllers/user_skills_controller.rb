class UserSkillsController < ApplicationController

  def index
    @user_skills = UserSkill.all
    if params[:query].present?
      @user_skills = UserSkill.joins(:skill).where(skill:{ name: params[:query].capitalize })
    end
  end

  def show
    # Find the user_skill instance based on the ID passed
    @user_skill = UserSkill.find(params[:id])

    # Retrieve the user for this user_skill
    @user = @user_skill.user

    # Get all the skills for the user, ordered in a way that the searched skill comes first (if a search exists)
    all_user_skills = @user.user_skills.where.not(id: params[:id]).includes(:skill)
    search_skill = params[:query].present? ? Skill.find_by(name: params[:query].capitalize) : nil

    if search_skill
      @user_skills_sorted = all_user_skills.sort_by { |us| us.skill == search_skill ? 0 : 1 }
    else
      @user_skills_sorted = all_user_skills
    end
  end
end
