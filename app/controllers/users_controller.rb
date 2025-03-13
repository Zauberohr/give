class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :city, skill_ids: [])
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
  end
end
