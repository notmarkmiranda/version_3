class Leagues::GamesController < ApplicationController
  def index
    @games = League.find_by_slug(params[:league_id]).games
  end

  def create
    game = Game.new(game_params!)
    if game.save
      flash[:success] = "Your game has been scheduled!"
      redirect_to league_path(game.league)
    else
    end
  end

  private

  def game_params!
    params.require(:game).permit(:season_id, :date, :buy_in_amount)
  end
end
