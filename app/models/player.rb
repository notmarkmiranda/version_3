class Player < ApplicationRecord
  belongs_to :game
  belongs_to :participant

  def get_score(players_count)

  end

  def full_name
    participant.full_name
  end
end
