class Api::RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
    render json: room
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    head :no_content
  end

  def update
    room = Room.find(params[:id])

    if room.update(room_params)
      render json: room
    else
      render json: { errors: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def room_param
    params.require(:room).permit(:name, :room_type, :description, :image)
  end
end
