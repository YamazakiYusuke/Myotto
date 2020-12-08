class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum native: { EN: 0, JP: 1, RU: 2 }, _suffix: true
  enum language1: { EN: 0, JP: 1, RU: 2 }, _suffix: true
  enum level1: { Beginner: 0, Elementary: 1, Intermediate: 2, Advanced: 3, Proficient: 4 }
end
