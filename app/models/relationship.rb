class RelationShip < ApplicationRecord
  belongs_to :follower_id, class_name: 'User'
  belongs_to :followed_id, class_name: 'User'

  validates :follower_id, :followed_id, presence: true
end