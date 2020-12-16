class UserLocaleStatus < ApplicationRecord
  belongs_to :locale
  belongs_to :user
end