class LeaguesController < ApplicationController
  def new
  end

  def show
    @league = League.find_by_slug(params[:id])
  end

  def create
    league = current_user.leagues.new(league_params!)
    league.slug = league.to_param
    if league.save
      flash[:success] = "New League Created!"
      redirect_to dashboard_path
    else
      flash[:danger] = league.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def league_params!
    params.require(:league).permit(:name, :slug, :user_id)
  end
end
