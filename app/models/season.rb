class Season < ApplicationRecord
  belongs_to :league
  has_many :games

  def display_status
    active ? "Active!" : "Inactive"
  end

  def self.current_season(user_id)
    joins(:league).where("leagues.user_id = ? AND active = ?", user_id, true).first
  end

end
