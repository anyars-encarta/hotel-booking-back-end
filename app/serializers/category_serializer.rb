class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :image, :description, :rooms
end
