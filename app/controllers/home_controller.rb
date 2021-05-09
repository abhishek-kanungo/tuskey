class HomeController < ApplicationController
  
  def index
    flash.discard
    @user = current_user
    @tasks = @user.try(:tasks)
  end
end
