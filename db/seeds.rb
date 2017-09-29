20.times do
  User.create(full_name: Faker::Internet.user_name, username: Faker::LordOfTheRings.unique.character, email: Faker::Internet.unique.email, password: Faker::Internet.password(8))
end

100.times do
  Question.create(title: Faker::Beer.name, description: Faker::ChuckNorris.fact, user_id: rand(1..20))
end
