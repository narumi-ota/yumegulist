FactoryBot.define do
  factory :user, aliases: [:owner] do
    name {"test"}
    sequence(:email) { |n| "tester#{n}@example.com" }
    password {"foobar"}
    password_confirmation {"foobar"}
  end

  factory :takashi, class: User do
    name {"Takashi"}
    email {"takashi@example.com"}
    password {"foobar"}
    password_confirmation {"foobar"}
    admin { false }
  end

  factory :satoshi, class: User do
    name {"Satoshi"}
    email {"satoshi@example.com"}
    password {"foobar"}
    password_confirmation {"foobar"}
    admin { false }
  end
  
  factory :admin, class: User do
    name {"Admin"}
    email {"admin@example.com"}
    password {"foobar"}
    password_confirmation {"foobar"}
    admin { true }
  end
end