require 'faker'

Category.create([{title: 'Book' }, {title: 'Magazine' }, {title: 'Manga' }])

10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
                      price: rand(300..999),
                      category_id: 1,
                  }])
end

10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
                      price: rand(300..1999),
                      category_id: 2,
                  }])
end

10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
                      price: rand(300..1999),
                      category_id: 3,
                  }])
end