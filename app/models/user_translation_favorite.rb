class UserTranslationFavorite < ApplicationRecord
  belongs_to :translation
  belongs_to :user

  validates :translation_id, :user_id, presence: true
end
