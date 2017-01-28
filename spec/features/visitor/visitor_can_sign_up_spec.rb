require "rails_helper"

RSpec.describe "Visitor can sign up", type: :feature do
  it "from the sign up or sign in path" do
    visit sign_up_path

    fill_in "E-Mail Address", with: "a@b.com"
    fill_in "Password", with: "password"
    click_button "Let's Go!"

    expect(current_path).to eq(dashboard_path)
  end
end
