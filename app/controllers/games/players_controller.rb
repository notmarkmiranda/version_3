class Games::PlayersController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @player = Player.new
    @participants = current_user.participants
  end

  def create
    @game = Game.find(params[:game_id])
    @player = @game.players.new(player_params!)
    if @player.save
      flash[:success] = "Scored!"
      redirect_to new_game_player_path(@game)
    else
    end
  end

  private

  def player_params!
    params.require(:player).permit(:participant_id, :finishing_place, :additional_expense, :game_id)
  end
end
