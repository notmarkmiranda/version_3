require "rails_helper"

RSpec.describe "user can log in and out", type: :feature do
  before do
    @user = create(:user)
  end

  it "logs in and out" do
    visit root_path

    expect(page).to_not have_content("Log Out")

    click_link "Sign In or Sign Up"
    fill_in "E-Mail Address", with: @user.email
    fill_in "Password", with: "password"
    click_button "Let's Go!"

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_content("Sign In or Sign Up")

    click_link "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Log Out")
  end
end
