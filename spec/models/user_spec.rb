require 'rails_helper'

RSpec.describe User, type: :model do
  it "self#sign_in_or_create - create" do
    params = { email: "test@example.com", password: "password" }
    expect(User.sign_in_or_create(params).class).to eq(User)
  end

  it "self#sign_in_or_create - find" do
    user = create(:user)
    expect(User.sign_in_or_create({ email: user.email })).to eq(user)
  end
end
