AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

15.times do
  Category.create(name: Faker::Commerce.department(1, true), description: Faker::Hipster.paragraph)
end

30.times do
  Product.create(category: Category.find_by_sql('SELECT name FROM categories ORDER BY RAND() LIMIT 1')[0].name, name: Faker::Commerce.product_name, description: Faker::Hipster.paragraph, price: Faker::Commerce.price, picture: Faker::Avatar.image)
end