class Book < ApplicationRecord
  belongs_to :user
  has_many :sentences, dependent: :destroy

  accepts_nested_attributes_for :sentences, allow_destroy: true

  validates :title, :language, presence: true
  validates :title,    length: { in: 1..100 }  
  validates :author,    length: { in: 1..100 }
  validates :level,    length: { in: 0..100 } 
  validates :language,    length: { in: 0..100 }  

  enum level: { Unknow: 0, Beginner: 1, Intermediate: 2, Advanced: 3 }
  enum language: { EN: 0, JP: 1, RU: 2 }

end
