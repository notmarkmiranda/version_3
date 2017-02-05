class Game < ApplicationRecord
  belongs_to :season
  delegate :league, to: :season

  validates :date, presence: true
  validates :buy_in_amount, presence: true
  validates :season_id, presence: true

  def active_status
    active ? "Active" : "Scored"
  end

  def full_date
    date.strftime("%B%e, %Y")
  end
end
