class Sentence < ApplicationRecord
  belongs_to :book
  has_many :translations, dependent: :destroy

  validates :book, presence: true
  validates :content,  length: { in: 0..1000 } 

  def self.make_sentences_from_book(locale , book_id , content)
    # "" or 「」の中で切らないようにする。
    # 段落の頭だけスペース
    # あまりに短い文を結合
    binding.pry
    if locale == 1 || locale == 3
      spliter = /\.|\?|!/
    else
      spliter = /\。|\？|!/
    end
    split_chars = content.split("").select{ |s| s.match(spliter) }
    sentences = content.split(spliter).zip(split_chars).map{|s| s.join }
    sentences.each do |s|
      Sentence.create(content: s,book_id: book_id)
    end
  end 
end
