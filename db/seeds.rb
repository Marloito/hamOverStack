wanted_users = 50
needed_users = wanted_users - User.count

wanted_questions = 50
needed_questions = wanted_questions - User.count

wanted_answers = 50
needed_answers = wanted_answers - User.count

needed_users.times do
  User.create(full_name: Faker::Internet.user_name, username: Faker::LordOfTheRings.unique.character, email: Faker::Internet.unique.email, password: Faker::Internet.password(8))
end

needed_questions.times do
  Question.create(title: Faker::Beer.name, description: Faker::ChuckNorris.fact, user_id: rand(1..50))
end

needed_answers.times do
  Answer.create(description: Faker::HarryPotter.quote, user_id: rand(1..50), question_id: rand(1..50))
end
