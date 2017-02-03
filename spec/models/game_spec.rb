require "rails_helper"

RSpec.describe Game, type: :model do
  context "validations" do
    it { should belong_to :season}
    it { should validate_presence_of :date }
    it { should validate_presence_of :buy_in_amount }
    it { should validate_presence_of :season_id }
  end
end
