class DmPair < ApplicationRecord
  belongs_to :sender_id, class_name: 'User'
  belongs_to :recipient_id, class_name: 'User'

  validates :sender_id, :recipient_id, presence: true
end