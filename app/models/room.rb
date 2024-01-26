class Room < ApplicationRecord
  belongs_to :category
  has_many :reservations

  def update_reserve
    self.update(reserved: !self.reserved);
  end
end
