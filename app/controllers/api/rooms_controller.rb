class Api::RoomsController < ApplicationController
  def show
    if params[:id]
      room = Room.find(params[:id])
      render json: room
    else
      rooms = Room.all
      render json: rooms
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    head :no_content
  end
end
