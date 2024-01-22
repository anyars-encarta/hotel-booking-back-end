class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :date, :city
  attribute :room do |reservation|
    reservation.room
  end
  attribute :room_category do |reservation|
    reservation.room.category
  end
end
