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
                      price: rand(300..999),
                      category_id: 1
                  }])
end
10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
                      price: rand(300..1999),
                      category_id: 2
                  }])
end
10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
                      price: rand(300..1999),
                      category_id: 3
                  }])
end
