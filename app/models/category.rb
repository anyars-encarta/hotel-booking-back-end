class Category < ApplicationRecord
  has_many :rooms

  validates :name, uniqueness: true
  validates :number_of_rooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :number_reserved, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
