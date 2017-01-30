class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    flash[:warning] = "See ya!"
    redirect_to root_path
  end
end
