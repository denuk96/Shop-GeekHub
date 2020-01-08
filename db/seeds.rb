if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'AdminPassword', admin: true])
else
  puts 'User already exist'
end

Category.create([{ title: 'Book', description: 'description' }, { title: 'Magazine', description: 'description' }, { title: 'Manga', description: 'description' }])

10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
                   price: rand(100..999)
                 }])
end

10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
                   price: rand(100..999)
                 }])
end

10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
                   price: rand(100..999)
                 }])
end

60.times do
  ProductCategory.create([{ category_id: rand(1..3), product_id: rand(1..30) }])
end

30.times do
  User.create([{ email: 'user' + rand(100..400).to_s + '@example.com', password: 'AdminPassword' }])
end

60.times do
  Comment.create([{
                      product_id: rand(1..30),
                      user_id: rand(1..30),
                      rating: rand(1..5),
                      body: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
                  }])
end

puts 'Seeded'