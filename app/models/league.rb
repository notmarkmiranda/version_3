class League < ApplicationRecord
  after_create_commit{ League.last.seasons.create! }
  # before_save :slug_creation

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :seasons
  has_many :games, through: :seasons
  has_many :players, through: :games
  has_many :participants, through: :players

  def active_games_count
    games.where(active: true).count
  end

  def biggest_game
    games.max_by(&:pot)
  end

  def completed_games_count
    games.where(active: false).count
  end

  def cumulative_pot
    games.map(&:pot).reduce(:+)
  end

  def games_count
    games.count
  end

  def last_game
    games.empty? ? "No Game Available" : games.max_by(&:date).full_date
  end

  def max_pot
    games.empty? ? 0 : games.max_by(&:pot).pot
  end

  def overall_leader
    participants.max_by(&:overall_score)
  end

  def seasons_count
    seasons.count
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def slug_creation
    update(slug: to_param)
  end

  def to_param
    name.parameterize
  end

  def unique_players
    participants.count
  end
end
