class Api::ReservationsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @reservations = Reservation.all
    render json: ReservationSerializer.new(@reservations).serializable_hash[:data].map {  |item| item[:attributes] }
  end

  def create
    # p params
    @user = User.find(params[:user_id])
    @room = Room.find(params[:room_id])


    reservation = Reservation.new(
      user_id: @user.id,
      room_id: @room.id,
    )


    if reservation.save
      @room.update(reserved: true);
      render json: reservation
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.reservations.destroy_all
      @room.update(reserved: false);
      render json: @room

    end

  end
end
