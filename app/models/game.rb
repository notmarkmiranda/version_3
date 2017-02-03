class Game < ApplicationRecord
  belongs_to :season
  delegate :league, to: :season

  validates :date, presence: true
  validates :buy_in_amount, presence: true
  validates :season_id, presence: true
end
