class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :translations, dependent: :destroy
  has_many :user_translation_favorites, dependent: :destroy
  has_many :user_translation_comments, dependent: :destroy
  has_many :user_locale_statuses, dependent: :destroy
  has_many :locales, through: :user_locale_statuses, source: :locale
  accepts_nested_attributes_for :user_locale_statuses, allow_destroy: true
  has_many :user_book_favorites, dependent: :destroy

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

###追記が必要###
  # has_many :senders, through: :passive_relationships, source: :follower
  # has_many :recipients, through: :passive_relationships, source: :follower
  # has_many :rooms, dependent: :destroy
################

  mount_uploader :icon, IconUploader

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :profile,    length: { maximum: 500 } 
  
  before_validation { email.downcase! }

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
