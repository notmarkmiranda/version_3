class Season < ApplicationRecord
  belongs_to :league
  has_many :games

  def display_status
    active ? "Active!" : "Inactive"
  end

  def self.current_season(user_id, league_id)
    joins(:league).where("active = ? AND leagues.id = ? AND leagues.user_id = ?", true, league_id, user_id).first
  end

end
