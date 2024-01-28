class Room < ApplicationRecord
  belongs_to :category
  has_many :reservations

  validates :name, presence: true
  validates :reserved, inclusion: { in: [true, false] }

  def update_reserve
    update(reserved: !reserved)
  end
end
