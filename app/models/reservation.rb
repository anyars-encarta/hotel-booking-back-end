class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :room_id, presence: true
  validates :user_id, presence: true
end
