class BookLocaleStatus < ApplicationRecord
  belongs_to :book
  belongs_to :locale
end