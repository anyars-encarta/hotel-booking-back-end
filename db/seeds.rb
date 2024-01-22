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
# cat1 = Category.create(name: 'Standard', description: 'standard room with A/C, TV, and double-size bed', image: 'https://www.eliaermouhotel.com/uploads/photos/D1024/2019/02/standardroom_1878.jpg', number_of_rooms: 0, number_reserved: 0, price: 120)
# cat2 = Category.create(name: 'Executive', description: 'executive room with A/C, TV, Fridge, and queen- size bed', image: 'https://www.strandhotellimerick.ie/wp-content/uploads/2021/05/Main_Bedroom-Executive-Double-1-1366x768-fp_mm-fpoff_0_0.jpg', number_of_rooms: 0, number_reserved: 0, price: 250)
# cat3 = Category.create(name: 'VIP', description: 'standard room with A/C, TV, and double-size bed', image: 'https://www.eliaermouhotel.com/uploads/photos/D1024/2019/02/standardroom_1878.jpg', number_of_rooms: 0, number_reserved: 0, price: 350)