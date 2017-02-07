require "rails_helper"

RSpec.describe "user can view active games" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    league = create(:league, user: user)
    game = create(:game, season: Season.last)
  end

  xit "from the dashboard path" do
    visit dashboard_path

    click_link "1 Active Game"
    expect(page).to have_content("Active")
    expect(page).to have_button("Score Game")
  end
end
