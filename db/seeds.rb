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
# user1 = User.create(username: 'anyars', admin: true)
# user2 = User.create(username: 'encarta', admin: true)
# user3 = User.create(username: 'yussif', admin: false)
# user4 = User.create(username: 'salaamat', admin: false)

room1 = Room.create(name: '001', category_id: 1)
room2 = Room.create(name: '002', category_id: 1)
room3 = Room.create(name: '003', category_id: 2)
room4 = Room.create(name: '004', category_id: 3)

