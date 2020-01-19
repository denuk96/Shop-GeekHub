if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'AdminPassword', admin: true])
else
  puts 'User already exist'
end

Category.create([{ title: 'Book', description: 'description' }, { title: 'Magazine', description: 'description' }, { title: 'Manga', description: 'description' }])

15.times do |n|
  Product.create(title: "Random product #{n}", description: "Book#{n} is a very interesting book", price: rand(100..999), category_ids: ["1"])
end

15.times do |n|
  Product.create(title: "Random book #{n}", description: "Book#{n} is a very interesting book", price: rand(100..999), category_ids: ["2"])
end

15.times do |n|
  Product.create(title: "Random stuff #{n}", description: "Book#{n} is a very interesting book", price: rand(100..999), category_ids: ["3"])
end

30.times do
  User.create([{ email: 'user' + rand(100..400).to_s + '@example.com', password: 'AdminPassword' }])
end

150.times do
  Comment.create([{
                   product_id: rand(1..45),
                   user_id: rand(2..31),
                   rating: rand(1..5),
                   body: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
                 }])
end

puts 'Seeded'
