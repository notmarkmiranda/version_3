FactoryGirl.define do
  factory :participant do
    sequence :first_name do |x|
      "Mark#{x}"
    end
    last_name "Miranda"
    user
  end
end
