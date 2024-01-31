require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it 'validates the presence of name' do
      room = Room.new
      expect(room).not_to be_valid
      expect(room.errors[:name]).to include("can't be blank")
    end
  end

  describe '#update_reserve' do
    it 'updates the reserved attribute to true if it is false' do
      room = Room.create(name: 'Room 1', reserved: false)
      room.update_reserve
      expect(room.reserved).to eq(true)
    end

    it 'updates the reserved attribute to false if it is true' do
      room = Room.create(name: 'Room 1', reserved: true)
      room.update_reserve
      expect(room.reserved).to eq(false)
    end
  end

  describe 'associations' do
    it 'belongs to a category' do
      room = Room.new
      expect(room).to respond_to(:category)
    end

    it 'has many reservations' do
      room = Room.new
      expect(room).to respond_to(:reservations)
    end
  end
end
