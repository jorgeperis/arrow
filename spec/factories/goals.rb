FactoryBot.define do
  factory :goal do
    association :user
    distance { 10.0 }
    target_time { 2400 }
  end
end
