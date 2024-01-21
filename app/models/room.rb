class Room < ApplicationRecord
  belongs_to :category
  has_many :reservations

  validates :name, uniqueness: true
end
