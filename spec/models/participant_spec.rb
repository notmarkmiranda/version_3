require "rails_helper"

RSpec.describe Participant, type: :model do
  context "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name).case_insensitive }
    it { should belong_to :user }
  end
end
