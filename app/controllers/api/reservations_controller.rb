class Api::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def create
    user = User.find(params[:user_id])
    room = Room.find(params[:room_id])

    reservation = Reservation.new(
      user:,
      room:,
      date: params[:date],
      city: params[:city]
    )

    if reservation.save
      render json: reservation
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
