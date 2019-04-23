FactoryBot.define do
  factory :user do
    name { "MyString" }
    sequence(:email) {|n| Faker::Internet.email.sub("@", "-#{n}@")}
    password_digest { "MyString" }
  end
end
