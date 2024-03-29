class Sentence < ApplicationRecord
  belongs_to :book
  has_many :translations, dependent: :destroy

  validates :book_id, presence: true
  validates :content,  length: { in: 0..1000 } 

  def self.make_sentences_from_book(book_id, content)
    spliter = /\。|\？|\!|\.|\?|!/
    
    split_chars = content.split("").select{ |s| s.match(spliter) }
    sentences = content.split(spliter).zip(split_chars).map{|s| s.join }
    sentences.each do |s|
      Sentence.create(content: s,book_id: book_id)
    end
  end 
end
