class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :translations, dependent: :destroy
  has_many :user_translation_favorites, dependent: :destroy
  has_many :user_translation_comments, dependent: :destroy
  has_many :user_locale_statuses, dependent: :destroy
  has_many :user_locales, through: :user_locale_statuses, source: :locale
  accepts_nested_attributes_for :user_locale_statuses, allow_destroy: true
  has_many :user_book_favorites, dependent: :destroy
###追記が必要###
  # has_many :following, through: :active_relationships, source: :followed
  # has_many :followers, through: :passive_relationships, source: :follower
  # has_many :senders, through: :passive_relationships, source: :follower
  # has_many :recipients, through: :passive_relationships, source: :follower
################
  has_many :rooms, dependent: :destroy

  # mount_uploader :icon, ImageUploader 

  validates :name,    length: { in: 1..100 }  
  validates :profile,    length: { maximum: 500 } 
  validates :locale_id, presence: true, on: :update
  validates :is_native, presence: true, on: :update, if: :is_native?
  validates :is_wanted, presence: true, on: :update, if: :is_wanted?

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def is_native?
    self.is_native == false
  end
  def is_wanted?
    self.is_wanted == false
  end
end
