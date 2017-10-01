post '/answers/:id' do
  answer = Answer.find(params[:id])
  question = Question.find(answer.question_id)
  if answer.best_answer
    answer.best_answer = false
    answer.save
    redirect "/questions/#{question.id}"
  else
    question.answers.each do |ans|
      ans.best_answer = false
      ans.save
    end
    answer.best_answer = true
    answer.save
    redirect "/questions/#{question.id}"
  end
end

post '/questions/:question_id/answers' do
  @answer = Answer.create(description: params[:description], user_id: session[:user_id], question_id: params[:question_id])
  @question = Question.find(params[:question_id])
  @best_answer = @question.answers.find_by(best_answer: true)

  if request.xhr?
    if @answer.id
      erb :'/answers/_show', layout: false
    else
      status 422
    end
  else
    @error_messages = @answer.errors.full_messages

    if @error_messages.length > 0
      erb  :"/questions/show"
    else
      redirect "/questions/#{params[:question_id]}"
    end
  end
end
