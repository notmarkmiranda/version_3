class League < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def to_param
    name.parameterize
  end
end
