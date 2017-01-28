FactoryGirl.define do
  factory :league do
    sequence :name do |x|
      "league number #{x}"
    end
    sequence :slug do |x|
      "league-number-#{x}"
    end
    user
  end
end
