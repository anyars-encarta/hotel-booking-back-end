class Api::RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
    render json: room
  end

  def create
    room = Room.new(room_params)

    if room.save
      category = Category.find(room.category_id)
      category.update(number_of_rooms: category.number_of_rooms + 1)

      render json: room, status: :created
    else
      render json: { errors: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    room = Room.find(params[:id])

    if room.update(room_params)
      render json: room
    else
      render json: { errors: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy

    category = Category.find(room.category_id)
    category.update(number_of_rooms: category.number_of_rooms - 1)

    head :no_content
  end

  private

  def room_params
    params.require(:room).permit(:name, :category_id)
  end
end
