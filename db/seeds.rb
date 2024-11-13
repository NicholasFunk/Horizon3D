# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

AdminUser.destroy_all
Product.destroy_all
Category.destroy_all


# Generate some categories
categories = ["Printer", "Material", "Safety", "Misc"]

categories.each do |category|
    Category.create(name: category)
end

100.times do
    category = Faker::Number.between(from: 1, to: 4)
    name = Faker::Commerce.product_name
    price = Faker::Commerce.price
    description = "This is a test product."
    stock_quantity = Faker::Number.number(digits: 2)
    product = Product.create(name: name, price: price, description: description, stock_quantity: stock_quantity, category_id: Category.pluck(:id).sample)

end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?