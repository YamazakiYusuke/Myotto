locales = ['en', 'jp', 'ru']

locales.each do |n|
  Locale.create!(
    name: n
  )
end

10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'hogehoge'
  profile = "Hello. I am #{name}. My email is #{email}. My password is #{password}"

  User.create!(
    name: name,
    email: email,
    password: password,
    profile: profile
  )
end

user_ids = User.all.map { |n| n.id }
locales_ids = Locale.all.map { |n| n.id }


user_ids.each do |n|
  UserLocaleStatus.create!(
    user_id: n,
    locale_id: locales_ids.sample,
    is_native: true
  )
  UserLocaleStatus.create!(
    user_id: n,
    locale_id: locales_ids.sample,
    is_wanted: true,
    wanted_level: ['Beginner','Elementary','Intermediate','Advanced','Proficient'].sample
  )
end

10.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  issued_date = Faker::Date.between(from: '1500-01-01', to: '1960-12-30')
  user_id = user_ids.sample

  Book.create!(
    title: title,
    author: author,
    issued_date: issued_date,
    user_id: user_id
  )
end

book_ids = Book.all.map { |n| n.id }

book_ids.each do |n|
  BookLocaleStatus.create!(
    book_id: n,
    locale_id: locales_ids.sample,
    is_main: true
  )
end


100.times do |n|
  contents = ["I don't drink soda very often, but when I was in Japan, there was a vending machine with melon soda for 100n!",
    "I am a little jealous that Japanese medicine seems to taste like those sodas though... ",
    "So, I also wanted to enjoy it as much as possible. ",
    "I have seen videos on YouTube where Japanese people try (taste test)Dr. Pepper and root beer, and say it tastes like medicine. ",
    "Alice kept her eyes anxiously fixed on it, for she felt sure she would catch a bad cold if she did not get dry very soon."]  

  Sentence.create!(
    content: contents.sample,
    book_id: book_ids.sample,
  )
end

sentence_ids = Sentence.all.map { |n| n.id }

100.times do |n|
  content = ["あまりよくソーダを飲みませんが、日本に行った時、自販機で100円の(値段の)メロンソーダがありました!","アメリカで、メロンソーダを見つけるのがすこし難しいので、ソーダを飲む時、いつもドクターペッパーやルートビアを飲みます。","だから、メロンソーダはできるだけ飲みたかったです","私はYouTubeで日本人がドクターペッパーやルートビアの味見をして、それが薬のような味だと言う動画をYouTubeで見たことがあります。"].sample

  Translation.create!(
    content: content,
    user_id: user_ids.sample,
    sentence_id:sentence_ids.sample
  )
end

translation_ids = Translation.all.map { |n| n.id }

translation_ids.each do |n|

  UserTranslationFavorite.create!(
    translation_id: n,
    user_id: user_ids.sample,
  )
end

translation_ids.each do |n|
  contents = ['いいね！','Good!','Хорошо!']
  UserTranslationComment.create!(
    content: contents.sample,
    translation_id: n,
    user_id: user_ids.sample,
  )
end
