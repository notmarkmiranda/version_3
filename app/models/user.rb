class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :leagues
  has_many :participants

  def self.sign_in_or_create(params)
    where(email: params[:email]).first_or_create(params)
  end
end
