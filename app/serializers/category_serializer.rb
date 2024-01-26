class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :price, :image, :number_of_rooms, :number_reserved,:description, :rooms
end
