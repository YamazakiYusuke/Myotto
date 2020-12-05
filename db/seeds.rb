
10.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  issued_date = Faker::Date.between(from: '1500-01-01', to: '1960-12-30')
  level = [0, 1, 2, 3].sample
  language = [0, 1, 2].sample

  Book.create!(
    title: title,
    author: author,
    issued_date: issued_date,
    level: level,
    language: language
  )
end