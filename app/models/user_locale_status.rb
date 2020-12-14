class UserLocaleStatus < ApplicationRecord
  belongs_to :locale
  belongs_to :user

  validates :locale_id, :user_id, presence: true
end