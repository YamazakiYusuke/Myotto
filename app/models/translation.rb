class Translation < ApplicationRecord
  belongs_to :user
  belongs_to :sentence

  validates :content, presence: true
  validates :content,    length: { in: 1..1000 } 
end
