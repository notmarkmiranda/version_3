class League < ApplicationRecord
  after_create_commit{ League.last.seasons.create! }
  # before_save :slug_creation

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :seasons
  has_many :games, through: :seasons

  def active_games_count
    games.where(active: true).count
  end

  def games_count
    games.count
  end

  def seasons_count
    seasons.count
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def to_param
    name.parameterize
  end

  def slug_creation
    update(slug: to_param)
  end
end
