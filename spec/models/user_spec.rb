require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many reservations' do
      user = User.new
      expect(user).to respond_to(:reservations)
    end
  end

  describe 'validations' do
    it 'validates the presence of username' do
      user = User.new(email: 'test@gmail.com', username: '', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end
  end
end
