class RequestsController < ApplicationController
  before_action :set_user_skill, only: [:create]
  before_action :set_request, only: [:completed, :complete]

  def index
    @requests_as_taker = current_user.requests
    @requests_as_giver = current_user.requests_as_giver
  end
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

  def completed
    @request.update(completed: true)
    @user = current_user.reload
    @user.balance -= 10
    @user.save!

    @creditor = @request.user_skill.user
    @creditor.balance += 10
    @creditor.save

    # render "requests/completed"
    redirect_to complete_request_path(@request)
    # redirect_to root_path
  end

  def complete
  end

  private

  def set_user_skill
    @user_skill = UserSkill.find(params[:user_skill_id])
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:date)
  end
end
