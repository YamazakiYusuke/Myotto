class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :translations, dependent: :destroy

  mount_uploader :icon, ImageUploader 

  validates :name,    length: { in: 1..100 }  
  validates :native,    length: { maximum: 10 } 
  validates :language1,    length: { maximum: 10 } 
  validates :level1,    length: { maximum: 100 } 
  validates :profile,    length: { maximum: 500 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum native: { EN: 0, JP: 1, RU: 2 }, _suffix: true
  enum language1: { EN: 0, JP: 1, RU: 2 }, _suffix: true
  enum level1: { Beginner: 0, Elementary: 1, Intermediate: 2, Advanced: 3, Proficient: 4 }
end
