FactoryBot.define do
  factory :user do
    name { "Yokoi" }
    email { "yokoi@gmail.com" }
    profile { "Hello!Myname is Yokoi!" }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
    admin { 'false' }
  end
end
