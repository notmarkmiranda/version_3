class ParticipantsController < ApplicationController

  def create
    participant = current_user.participants.new(participant_params!)
    if participant.save
      flash[:success] = "player created!"
      redirect_to dashboard_path
    else
      flash[:danger] = "something went wrong!"
      redirect_to dashboard_path
    end
  end

  private

  def participant_params!
    params.require(:participant).permit(:first_name, :last_name, :user_id)
  end
end
