
50.times do
  User.create(full_name: Faker::LordOfTheRings.character, username: Faker::Internet.unique.user_name, email: Faker::Internet.unique.email, password: Faker::Internet.password(8))
end

20.times do
  Question.create(title: Faker::Beer.name, description: Faker::ChuckNorris.fact, user_id: rand(1..50))
end

User.all.each do |user|
  question = Question.find(rand(1..20))
  if user.id != question.user_id
    Answer.create(description: Faker::HarryPotter.quote, user_id: user.id, question_id: question.user_id)
  end
end
