
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

book_ids = Book.all.map { |n| n.id }
contents = ["They were indeed a queer-looking party that assembled on the bank—the birds with draggled feathers, the animals with their fur clinging close to them, and all dripping wet, cross, and uncomfortable.",
  "The first question of course was, how to get dry again: they had a consultation about this, and after a few minutes it seemed quite natural to Alice to find herself talking familiarly with them, as if she had known them all her life. ",
  "Indeed, she had quite a long argument with the Lory, who at last turned sulky, and would only say, “I am older than you, and must know better;” and this Alice would not allow without knowing how old it was, and, as the Lory positively refused to tell its age, there was no more to be said.",
  "At last the Mouse, who seemed to be a person of authority among them, called out, “Sit down, all of you, and listen to me! I’ll soon make you dry enough!” They all sat down at once, in a large ring, with the Mouse in the middle.",
  "Alice kept her eyes anxiously fixed on it, for she felt sure she would catch a bad cold if she did not get dry very soon."]

100.times do |n|
  content = contents.sample
  book_id = book_ids.sample

  Sentence.create!(
    content: content,
    book_id: book_id
  )
end
