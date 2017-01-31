class UsersController < ApplicationController
  def new
  end

  def show
    @leagues = current_user.leagues
  end

  def create
    user = User.sign_in_or_create(user_params!)
    if user.id && user.authenticate(user_params![:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome!"
      redirect_to dashboard_path
    else
      flash.now[:warning] = "Something went wrong! Try again!"
      render :new
    end
  end

  private

  def user_params!
    params.require(:user).permit(:email, :password)
  end
end
