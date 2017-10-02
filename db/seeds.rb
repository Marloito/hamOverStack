User.create(full_name: "blaine", username: "blaine", email: "blaine@gmail.com", password: "password")
User.create(full_name: "marlo", username: "marlo", email: "marlo@gmail.com", password: "password")
User.create(full_name: "eliza", username: "eliza", email: "eliza@gmail.com", password: "password")
User.create(full_name: "hassan", username: "hassan", email: "hassan@gmail.com", password: "password")

200.times do
  User.create(full_name: Faker::LordOfTheRings.character, username: Faker::Internet.unique.user_name, email: Faker::Internet.unique.email, password: Faker::Internet.password(8))
end

25.times do
  Question.create(title: Faker::Beer.name, description: Faker::ChuckNorris.fact, user_id: rand(1..50))
end

User.all.each do |user|
  question = Question.all.sample
  if user.id != question.user_id && !question.answers.find_by(user_id: user.id)
    Answer.create(description: Faker::HarryPotter.quote, user_id: user.id, question_id: question.user_id)
  end
end

1000.times do
  Answer.all.sample.votes.create(value: [1, -1].sample)
end
