class Api::CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    categories = Category.all
    render json: categories
  end

  def show
    render json: @category
  end

  def rooms
    category = Category.find(params[:id])
    rooms = category.rooms
    render json: rooms
  end

  def create
    category = Category.new(category_params)

    if category.persisted?
      render json: category, status: :ok
    elsif category.save
      render json: category, status: :created
    else
      Rails.logger.error("Error saving category: #{category.errors.full_messages}")
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :image, :number_of_rooms, :number_reserved, :price)
  end
end
