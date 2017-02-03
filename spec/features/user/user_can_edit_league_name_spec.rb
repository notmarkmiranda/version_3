require "rails_helper"

RSpec.describe "user can edit league name", type: :feature do
  before do
    user = create(:user)
    @league = create(:league, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  xit "from the user dashboard", js: true do
    visit dashboard_path

    within(".league-actions") do
      click_button "Edit League Name"
    end
    fill_in "League Name", with: "Super Duper League"
    click_button "update-league"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Super Duper League")
  end
end
