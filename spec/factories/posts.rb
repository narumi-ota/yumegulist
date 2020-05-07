FactoryBot.define do
  factory :post do
    name { "Test post" }
    content { "Test content" }
    place { "Test place" }
    rate { 1.5 }
    association :owner
  end
end