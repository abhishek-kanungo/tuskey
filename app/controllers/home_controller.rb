class HomeController < ApplicationController
  
  def index
    debugger
    @user = current_user
  end
end
