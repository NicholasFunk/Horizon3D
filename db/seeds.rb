# Author: Nicholas Funk
# Date: 2024-11-17

require 'net/http'
require 'json'

AdminUser.destroy_all
Product.destroy_all
Category.destroy_all

# fetch prices from the fakestoreapi.com
url_products = URI.parse('https://fakestoreapi.com/products')
response = Net::HTTP.get_response(url_products)
products_data = JSON.parse(response.body)

pricelist = []

products_data.each do |product|
    puts product["price"]
    pricelist << product["price"]
end

puts pricelist

# Generate some categories
categories = ["Printer", "Material", "Safety", "Misc"]

categories.each do |category|
    Category.create(name: category)
end

100.times do
    category = Category.all.sample
    name = Faker::Commerce.product_name
    price = pricelist.sample
    description = "This #{category.name} item, is a test product."
    stock_quantity = Faker::Number.number(digits: 2)
    product = Product.create(name: name, price: price, description: description, stock_quantity: stock_quantity, category_id: category.id)

end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?