FactoryBot.define do
  factory :user do
    name { "Admin" }
    email { "adminyokoi@gmail.com" }
    profile { "Hello!Myname is Admin!" }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
    admin { 'true' }
  end
end
