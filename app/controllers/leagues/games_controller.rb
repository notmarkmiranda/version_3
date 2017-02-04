class Leagues::GamesController < ApplicationController
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
