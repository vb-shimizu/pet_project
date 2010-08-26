class ToppageController < ApplicationController

  def top
    debugger
    @user = UserSession.find.user
    #@user = @current_user
  end

end
