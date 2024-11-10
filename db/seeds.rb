# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all

200.times do

    name = Faker::Commerce.product_name
    price = Faker::Commerce.price
    description = "This is a test product."
    stock_quantity = Faker::Number.number(digits: 2)
    product = Product.create(name: name, price: price, description: description, stock_quantity: stock_quantity)

end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?