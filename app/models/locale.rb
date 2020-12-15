class Locale < ApplicationRecord
  has_many :book_locale_statuses, dependent: :destroy
  has_many :user_locale_statuses, dependent: :destroy

  validates :name, uniqueness: true
end