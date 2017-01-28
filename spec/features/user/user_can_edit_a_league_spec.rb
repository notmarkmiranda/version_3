require "rails_helper"

RSpec.describe "User can edit a league", type: :feature do
  before do
    @user = create(:user)
    @league = create(:league, user: @user)
  end

  it "allows a user to edit the name of the league" do
    visit edit_league_path(@league)

    fill_in "Name", with: "newer league"
    click_button "Update League!"

    @league.reload
    expect(current_path).to eq(league_path(@league))
    expect(page).to have_content("Newer league")
    expect(page).to have_content("newer-league")
  end
end
