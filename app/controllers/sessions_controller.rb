class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    flash[:danger] = "See ya!"
    redirect_to root_path
  end
end
