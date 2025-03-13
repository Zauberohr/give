class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
  end

end
