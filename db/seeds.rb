# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

22.times do
  Story.create(user_id: 1,
  				title: Faker::Lorem.words(rand(2..10)),
              content: Faker::Lorem.paragraphs(rand(2..8)),
              category_id: 1,
              status: 'Published')

  sleep 1
end
