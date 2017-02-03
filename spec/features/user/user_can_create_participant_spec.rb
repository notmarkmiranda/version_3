require "rails_helper"

RSpec.describe "user can create a participant", type: :feature do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "from user dashboard", js: true do
    visit dashboard_path
    within('.actions.row') do
      click_button "Create Player!"
    end
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    click_button "New Player!"

    expect(current_path).to eq(dashboard_path)
  end
end
