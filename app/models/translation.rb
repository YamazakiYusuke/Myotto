class Translation < ApplicationRecord
  belongs_to :user
  belongs_to :sentence
  has_many :user_translation_favorites, dependent: :destroy
  has_many :user_translation_comments, dependent: :destroy

  validates :content, :user_id, :sentence_id, :book_locale,:user_locale, presence: true
  validates :content,    length: { in: 1..1000 } 

  scope :translation_scope, -> (sentence) { where('content like?', "%#{sentence}%") }
end
