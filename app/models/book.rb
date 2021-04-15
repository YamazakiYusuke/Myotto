class Book < ApplicationRecord
  belongs_to :user
  has_many :sentences, dependent: :destroy
  has_many :book_locale_statuses, dependent: :destroy
  has_many :locale, through: :book_locale_statuses, source: :locale

  accepts_nested_attributes_for :sentences, allow_destroy: true
  accepts_nested_attributes_for :book_locale_statuses, allow_destroy: true

  mount_uploader :image, BookImageUploader
  
  validates :title, presence: true
  validates :title,    length: { in: 1..500 }  
  validates :author,    length: { in: 1..100 }
end
