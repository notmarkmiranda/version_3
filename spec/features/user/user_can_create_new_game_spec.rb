require "rails_helper"

RSpec.describe "user can create a new game", type: :feature do
  before do
    user = create(:user)
    @league = create(:league, user: user)
    season = Season.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "makes a new game", js: true do
    visit dashboard_path
    click_button "Schedule Game"
    fill_in "Date", with: "01/01/2012"
    fill_in "Buy In Amount", with: "100"
    click_button "new-game"
    sleep(1)
    expect(current_path).to eq(league_path(@league))
    # within('.stats') do
    #   expect(page).to have_content("1 Game")
    # end
  end
end
