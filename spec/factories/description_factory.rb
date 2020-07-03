
FactoryBot.define do
  factory :description do
    sequence(:text) { |n| "A nice description (#{n})" }
    sequence(:language) {"es" }
  end
end