FactoryBot.define do
  factory :post do
    name { "MyString" }
    content { "MyText" }
    place { "MyString" }
    rate { 1.5 }
    user { nil }
  end
end