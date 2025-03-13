class RequestsController < ApplicationController
  before_action :set_user_skill, only: [:create]

  def show
    @role = :taker
    @request = Request.find(params[:id])
    @message = Message.new
  end

  def create
    @request = Request.new
    @request.user_skill = @user_skill
    @request.user = current_user
    if @request.save
      redirect_to @request, notice: "Request successfully created"
    else
      render "user_skills/show"
    end
  end

  private

  def set_user_skill
    @user_skill = UserSkill.find(params[:user_skill_id])
  end

  def request_params
    params.require(:request).permit(:date)
  end
end
