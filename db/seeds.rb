# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Users

# Categories
cat1 = Category.create(name: 'Standard', description: 'standard room with A/C, TV, and double-size bed', image: 'https://www.eliaermouhotel.com/uploads/photos/D1024/2019/02/standardroom_1878.jpg', number_of_rooms: 2, number_reserved: 0, price: 120)
cat2 = Category.create(name: 'Executive', description: 'Executive room with A/C, TV, Fridge, and queen- size bed', image: 'https://www.strandhotellimerick.ie/wp-content/uploads/2021/05/Main_Bedroom-Executive-Double-1-1366x768-fp_mm-fpoff_0_0.jpg', number_of_rooms: 1, number_reserved: 0, price: 250)

# Rooms
room1 = Room.create(name: 'Room 1', category_id: cat1.id, reserved: false)
room2 = Room.create(name: 'Room 2', category_id: cat1.id, reserved: false)
room3 = Room.create(name: 'Room 3', category_id: cat2.id, reserved: false)

# message
puts 'Seeded 2 categories and 3 rooms'
