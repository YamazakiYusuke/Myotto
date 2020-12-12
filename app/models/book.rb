class Book < ApplicationRecord
  belongs_to :user
  has_many :sentences, dependent: :destroy
  has_one :book_locale_statuse, dependent: :destroy
  has_one :locale, through: :book_locale_statuse, source: :locale

  accepts_nested_attributes_for :sentences, allow_destroy: true
  accepts_nested_attributes_for :book_locale_statuse, allow_destroy: true

  validates :title, presence: true
  validates :title,    length: { in: 1..500 }  
  validates :author,    length: { in: 1..100 }
end
