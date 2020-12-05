class Book < ApplicationRecord
  validates :title, :language, presence: true
  has_many :sentences, dependent: :destroy

  enum level: { Unknow: 0, Beginner: 1, Intermediate: 2, Advanced: 3 }
  enum language: { EN: 0, JP: 1, RU: 2 }
end
