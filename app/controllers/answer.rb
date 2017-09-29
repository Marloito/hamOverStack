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
post '/questions/:question_id/answers' do
  answer = Answer.create(description: params[:description], user_id: session[:user_id], question_id: params[:question_id])

  @error_messages = answer.errors.full_messages
  if @error_messages.length > 0
    @question = Question.find(params[:question_id])
    erb  :"/questions/show"
  else
    redirect "/questions/#{params[:question_id]}"
  end
end
