class User < ApplicationRecord
  has_secure_password

  def self.sign_in_or_create(params)
    where(email: params[:email]).first_or_create(params)
  end
end
