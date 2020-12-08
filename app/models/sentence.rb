class Sentence < ApplicationRecord
  belongs_to :book

  validates :content, presence: true

  def self.make_sentences_from_book(language,book_id,content)
    # "" or 「」の中で切らないようにする。
    # 段落の頭だけスペース
    # あまりに短い文を結合
    if language == "EN" || language == "RU"
      spliter = /\.|\?|!/
    else language == "JP"
      spliter = /\。|\？|!/
    end
    split_chars = content.split("").select{ |s| s.match(spliter) }
    sentences = content.split(spliter).zip(split_chars).map{|s| s.join }
    sentences.each do |s|
      Sentence.create(content: s,book_id: book_id)
    end
  end 
end
