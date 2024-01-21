class Room < ApplicationRecord
  belongs_to :category
  has_many :reservations
end
