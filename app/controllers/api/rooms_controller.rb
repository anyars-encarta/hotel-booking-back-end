class Api::RoomsController < ApplicationController
  def rooms
    rooms = Room.all
    render json: rooms
  end
end
