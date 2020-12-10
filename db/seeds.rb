
10.times do |n|
  name = Faker::Name.name
  native = ['EN','JP','RU'].sample
  language1 = [0,1,2].sample
  level1 = [0,1,2,3,4].sample
  email = Faker::Internet.email
  password = 'hogehoge'
  profile = "私の名前は川島達史です。ちょっと珍しい名前だと言われます。タツシが噛みやすいので、自分の名前なのにたまに噛んだりしてしまいます。"

  User.create!(
    name: name,
    native: native,
    language1: language1,
    level1: level1,
    email: email,
    password: password,
    profile: profile
  )
end

user_ids = User.all.map { |n| n.id }

10.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  issued_date = Faker::Date.between(from: '1500-01-01', to: '1960-12-30')
  level = [0, 1, 2, 3].sample
  language = [0, 1, 2].sample
  user_id = user_ids.sample

  Book.create!(
    title: title,
    author: author,
    issued_date: issued_date,
    level: level,
    language: language,
    user_id: user_id
  )
end

book_ids = Book.all.map { |n| n.id }

100.times do |n|
  contents = ["They were indeed a queer-looking party that assembled on the bank—the birds with draggled feathers, the animals with their fur clinging close to them, and all dripping wet, cross, and uncomfortable.",
    "The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them, as if she had known them all her life. ",
    "Indeed, she had quite a long argument with the Lory, who at last turned sulky, and would only say, “I am older than you, and must know better;” and this Alice would not allow without knowing how old it was, and, as the Lory positively refused to tell its age, there was no more to be said.",
    "At last the Mouse, who seemed to be a person of authority among them, called out, “Sit down, all of you, and listen to me! I’ll soon make you dry enough!” They all sat down at once, in a large ring, with the Mouse in the middle.",
    "Alice kept her eyes anxiously fixed on it, for she felt sure she would catch a bad cold if she did not get dry very soon."]  
  content = contents.sample
  book_id = book_ids.sample

  Sentence.create!(
    content: content,
    book_id: book_id,
  )
end

sentence_ids = Sentence.all.map { |n| n.id }

1000.times do |n|
  content = ["翻訳AAAAAAAAAAAAAAAAAAAAAAAAA","翻訳BBBBBBBBBBBBBBBBBBBBBBBB","翻訳CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC","翻訳DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"].sample
  user_id = user_ids.sample
  sentence_id =sentence_ids.sample

  Translation.create!(
    content: content,
    user_id: user_id,
    sentence_id:sentence_id
  )
end
