class Game < ApplicationRecord
  include NumberFormatter

  belongs_to :season
  delegate :league, to: :season
  has_many :players

  validates :date, presence: true
  validates :buy_in_amount, presence: true
  validates :season_id, presence: true

  def active_status
    active ? "Active" : "Scored"
  end

  def calculate_scores
    players.each do |player|
      player.update(score: get_individual_score(player))
    end
  end

  def full_date
    date.strftime("%B%e, %Y")
  end

  def player_count
    players.count
  end

  def pot
    players.count * buy_in_amount + players.sum(:additional_expense)
  end

  def first_or(place=1)
    players.where(finishing_place: place).first.participant
  end

  private

  def get_individual_score(player)
    numerator = players.count * buy_in_amount * buy_in_amount / buy_in_amount + player.additional_expense
    denominator = player.finishing_place + 1
    clean_to_two_digits(Math.sqrt(numerator) / denominator)
  end
end
