# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

60.times do
  Comment.create(commentable_type: 'Story',
  				commentable_id: 4,
  				user_id: 1,
              body: Faker::Lorem.paragraph(2, false, 4))

  sleep 1
end
