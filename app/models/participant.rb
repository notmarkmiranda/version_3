class Participant < ApplicationRecord
  include NumberFormatter
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :first_name, scope: :last_name, case_sensitive: false
  belongs_to :user
  has_many :players

  def full_name
    "#{first_name} #{last_name}"
  end

  def overall_games_count
    players.count
  end

  def overall_score
    top_five_scores = get_top_five_scores
    clean_to_two_digits(top_five_scores.reduce(:+) / 5)
  end

  def overall_won_or_placed_percentage
    (overall_won_or_placed_count / overall_games_count.to_f * 100).floor
  end

  private

  def get_top_five_scores
    players.pluck(:score).compact.max(5)
  end

  def overall_won_or_placed_count
    players.where(finishing_place: [1,2,3]).count
  end



end
