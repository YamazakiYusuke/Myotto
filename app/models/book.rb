class Book < ApplicationRecord
  has_many :sentences, dependent: :destroy

  accepts_nested_attributes_for :sentences, allow_destroy: true

  validates :title, :language, presence: true

  enum level: { Unknow: 0, Beginner: 1, Intermediate: 2, Advanced: 3 }
  enum language: { EN: 0, JP: 1, RU: 2 }

end
