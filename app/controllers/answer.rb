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
