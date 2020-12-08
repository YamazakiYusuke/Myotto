class Translation < ApplicationRecord
  belongs_to :user
  belongs_to :sentence

  validates :content, presence: true
end
