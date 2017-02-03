require "rails_helper"

RSpec.describe "user can create a league", type: :feature do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "creates a new league", js: true do
    visit dashboard_path
    within('.actions.row') do
      click_button "Create League!"
    end


    fill_in "League Name", with: "test league"
    click_button "New League!"

    expect(current_path).to eq(dashboard_path)
    within('.leagues') do
      expect(page).to have_link("test league")
    end

  end
end
