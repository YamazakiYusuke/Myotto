class BookLocaleStatus < ApplicationRecord
  belongs_to :book
  belongs_to :locale

  validates :book_id, :locale_id, presence: true
end