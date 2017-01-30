class League < ApplicationRecord
  after_create_commit{ League.last.seasons.create! }
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :seasons

  def seasons_count
    seasons.count
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def to_param
    name.parameterize
  end
end
