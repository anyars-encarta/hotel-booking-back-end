class Room < ApplicationRecord
  belongs_to :category
  has_many :reservations

  def update_reserve
    update(reserved: !reserved)
  end
end
