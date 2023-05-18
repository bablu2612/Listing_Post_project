# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'hello@postyourcars.com', password: "Post2023!",role: 'admin')

# http://localhost:3000/buyer_listings/24313f8d9324e8f8d92bb45b23e9fa
# http://localhost:3000/buyer_listings  (buyers)