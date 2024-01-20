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
user1 = User.create(username: 'anyars', admin: true)
user2 = User.create(username: 'encarta', admin: true)
user3 = User.create(username: 'yussif', admin: false)
user4 = User.create(username: 'salaamat', admin: false)

# Categories
cat1 = Category.create(name: 'Standard', description: 'standard room with A/C, TV, and double-size bed', image: 'https://www.eliaermouhotel.com/uploads/photos/D1024/2019/02/standardroom_1878.jpg', number_of_rooms: 0, number_reserved: 0)
cat2 = Category.create(name: 'Executive', description: 'executive room with A/C, TV, Fridge, and queen- size bed', image: 'https://www.strandhotellimerick.ie/wp-content/uploads/2021/05/Main_Bedroom-Executive-Double-1-1366x768-fp_mm-fpoff_0_0.jpg', number_of_rooms: 0, number_reserved: 0)
cat3 = Category.create(name: 'VIP', description: 'VIP room with A/C, TV, bathroom water heater, and queen-size bed', image: 'https://www.frommers.com/system/media_items/attachments/000/855/448/s980/Palms-Two-Story-Sky-Villa-Bedroom-crop.jpg?1440441521', number_of_rooms: 0, number_reserved: 0)

# Rooms
room1 = Room.create(name: 'Room 1', category_id: cat1.id)
room2 = Room.create(name: 'Room 2', category_id: cat2.id)
room3 = Room.create(name: 'Room 3', category_id: cat1.id)
room4 = Room.create(name: 'Room 4', category_id: cat3.id)

# Reservations
reserve1 = Reservation.create(user_id: user1.id, room_id: room3.id, date: '2024-01-31', city: 'Kumasi')
reserve2 = Reservation.create(user_id: user4.id, room_id: room1.id, date: '2024-02-25', city: 'Accra')
reserve3 = Reservation.create(user_id: user1.id, room_id: room4.id, date: '2024-03-31', city: 'Kumasi')
reserve4 = Reservation.create(user_id: user2.id, room_id: room2.id, date: '2024-01-19', city: 'Tamale')
reserve5 = Reservation.create(user_id: user2.id, room_id: room2.id, date: '2024-01-24', city: 'Accra')
reserve6 = Reservation.create(user_id: user1.id, room_id: room4.id, date: '2024-02-15', city: 'Kumasi')
reserve7 = Reservation.create(user_id: user3.id, room_id: room3.id, date: '2024-03-03', city: 'Accra')
reserve8 = Reservation.create(user_id: user2.id, room_id: room1.id, date: '2024-01-20', city: 'Tamale')
reserve9 = Reservation.create(user_id: user4.id, room_id: room2.id, date: '2024-02-22', city: 'Tamale')
reserve10 = Reservation.create(user_id: user4.id, room_id: room4.id, date: '2024-02-14', city: 'Accra')
reserve11 = Reservation.create(user_id: user2.id, room_id: room3.id, date: '2024-03-21', city: 'Kumasi')
reserve12 = Reservation.create(user_id: user4.id, room_id: room1.id, date: '2024-02-15', city: 'Accra')
reserve13 = Reservation.create(user_id: user3.id, room_id: room2.id, date: '2024-04-26', city: 'Tamale')
reserve14 = Reservation.create(user_id: user2.id, room_id: room4.id, date: '2024-04-03', city: 'Kumasi')
reserve15 = Reservation.create(user_id: user1.id, room_id: room2.id, date: '2024-01-22', city: 'Kumasi')
reserve16 = Reservation.create(user_id: user3.id, room_id: room1.id, date: '2024-01-19', city: 'Tamale')