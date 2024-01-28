require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      reservation = Reservation.new
      expect(reservation).to respond_to(:user)
    end
    it 'belongs to a room' do
      reservation = Reservation.new
      expect(reservation).to respond_to(:room)
    end

  end

  describe 'validations' do
    it 'validates the presence of room_id' do
      reservation = Reservation.new(user_id: 1)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:room_id]).to include("can't be blank")
    end

    it 'validates the presence of user_id' do
      reservation = Reservation.new(room_id: 1)
      expect(reservation).not_to be_valid
      expect(reservation.errors[:user_id]).to include("can't be blank")
    end
  end
end
