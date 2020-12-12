class UserTranslationComment < ApplicationRecord
  belongs_to :translation
  belongs_to :user

  validates :translation_id, :user_id, :content, presence: true

  def self.make_native(user_id, locale_id, is_native)
    
  end

  def self.make_wanted(user_id, locale_id, is_wanted, wanted_level)
    
  end
end