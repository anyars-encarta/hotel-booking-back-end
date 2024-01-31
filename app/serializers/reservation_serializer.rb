class ReservationSerializer
  include JSONAPI::Serializer
  attributes :id, :created_at, :city
  attribute :room, &:room
  attribute :user do |reservation|
    {
      username: reservation.user.username,
      email: reservation.user.email
    }
  end
end
