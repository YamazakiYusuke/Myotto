class UserTranslationComment < ApplicationRecord
  belongs_to :translation
  belongs_to :user

  validates :translation_id, :user_id, :content, presence: true
end