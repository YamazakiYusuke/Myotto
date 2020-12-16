class Room < ApplicationRecord
  belongs_to :user
  belongs_to :dm_pair

  validates :user, :dm_pair, presence: true
end