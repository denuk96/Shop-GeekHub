require 'faker'

Category.create([{title: 'Book' }, {title: 'Magazine' }, {title: 'Manga' }])

10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Movies::HarryPotter.quote,
                      price: rand(1..2000),
                      category_id: 1,
                  }])
end

10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Movies::HarryPotter.location,
                      price: rand(1..2000),
                      category_id: 2,
                 }])
end

10.times do
  Product.create([{
                      title: Faker::Book.title,
                      description: Faker::Movies::Hobbit.quote,
                      price: rand(1..2000),
                      category_id: 3,
                  }])
end