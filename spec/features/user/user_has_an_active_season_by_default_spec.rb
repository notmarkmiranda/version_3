require "rails_helper"

RSpec.describe "active season by default with a new league", typ: :feature do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "creates an active season when creating a new league" do
    visit new_league_path

    fill_in "Name", with: "Super Duper Home Fun League"
    click_button "Create League!"

    expect(current_path).to eq(dashboard_path)

    within('.stats') do
      expect(page).to have_content("1 Season")
      # expect(page).to have_content("season-id-#{Season.last.id}")
      # expect(page).to have_content("Active!")
    end
  end
end
