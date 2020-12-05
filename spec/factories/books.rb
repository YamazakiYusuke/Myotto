FactoryBot.define do
  factory :book do
    title { "MyString" }
    author { "MyString" }
    issued_date { "2020-12-04 16:05:29" }
    level { 1 }
    language { 1 }
  end
end
