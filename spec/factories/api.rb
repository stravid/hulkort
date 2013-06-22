FactoryGirl.define do
  sequence :repository_name do |n|
    "repository#{n}"
  end

  factory :commit

  factory :repository do
    name { FactoryGirl.generate(:repository_name) }
  end
end
