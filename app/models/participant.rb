class Participant < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :first_name, scope: :last_name, case_sensitive: false
  belongs_to :user
  has_many :players
end
