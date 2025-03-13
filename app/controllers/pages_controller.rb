# class PagesController < ApplicationController
#   skip_before_action :authenticate_user!, only: [ :home ]

#   def home
#   end
# end


class PagesController < ApplicationController
  # Disable authentication check for the home action
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end


  def dashboard
    @user = current_user
  end

  def edit
    @user = current_user
  end

end
