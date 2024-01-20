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
  
  private

  def set_category
    @category = Category.find(params[:id])
  end
end
