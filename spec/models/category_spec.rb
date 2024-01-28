require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'validates the presence of name' do
      category = Category.new(number_of_rooms: 10, number_reserved: 2, price: 100)
      expect(category).not_to be_valid
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'validates the uniqueness of name' do
      Category.create(name: 'Standard', number_of_rooms: 10, number_reserved: 2, price: 100)
      category = Category.new(name: 'Standard', number_of_rooms: 5, number_reserved: 1, price: 50)
      expect(category).not_to be_valid
      expect(category.errors[:name]).to include('has already been taken')
    end

    it 'validates the numericality of number_of_rooms' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 'invalid', number_reserved: 2, price: 100)
      expect(category).not_to be_valid
      expect(category.errors[:number_of_rooms]).to include('is not a number')
    end

    it 'validates the numericality of number_reserved' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 10, number_reserved: 'invalid', price: 100)
      expect(category).not_to be_valid
      expect(category.errors[:number_reserved]).to include('is not a number')
    end

    it 'validates the numericality of price' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 10, number_reserved: 2, price: 'invalid')
      expect(category).not_to be_valid
      expect(category.errors[:price]).to include('is not a number')
    end

    it 'validates that number_of_rooms is greater than or equal to 0' do
      category = Category.new(name: 'Deluxe', number_of_rooms: -1, number_reserved: 2, price: 100)
      expect(category).not_to be_valid
      expect(category.errors[:number_of_rooms]).to include('must be greater than or equal to 0')
    end

    it 'validates that number_reserved is greater than or equal to 0' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 10, number_reserved: -1, price: 100)
      expect(category).not_to be_valid
      expect(category.errors[:number_reserved]).to include('must be greater than or equal to 0')
    end

    it 'validates that price is greater than or equal to 0' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 10, number_reserved: 2, price: -1)
      expect(category).not_to be_valid
      expect(category.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'is valid with all the required attributes' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 10, number_reserved: 2, price: 100)
      expect(category).to be_valid
    end
  end

  describe 'associations' do
    it 'has many rooms' do
      category = Category.new(name: 'Deluxe', number_of_rooms: 10, number_reserved: 2, price: 100)
      expect(category).to respond_to(:rooms)
    end
  end
end
