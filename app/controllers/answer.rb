get '/answers/:id' do
  answer = Answer.find(params[:id])
  question.answers.each do |ans|
    ans.best_answer = false
    ans.save
  end
  answer.best_answer = true
  answer.save
  redirect "/questions/#{question.id}"
end
