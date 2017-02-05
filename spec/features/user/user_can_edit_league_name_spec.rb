require "rails_helper"

RSpec.describe "user can edit league name", type: :feature do
  before do
    user = create(:user)
    @league = create(:league, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "from the league show page", js: true do
    visit league_path(@league)

    within(".actions.row") do
      click_button "Edit League Name"
    end
    fill_in "League Name", with: "Super Duper League"
    click_button "update-league"
    @league.reload
    expect(current_path).to eq(league_path(@league))
    expect(page).to have_content("Super Duper League")
  end
end
