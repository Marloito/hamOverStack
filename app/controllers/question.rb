get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end
get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @best_answer = @question.answers.find_by(best_answer: true)
  erb :'/questions/show'
end

post '/questions' do
  question = Question.new(params[:question])
  question[:user_id] = session[:user_id]
  if question.save
    redirect "/questions/#{question.id}"
  else
    @error_messages = question.errors.full_messages
    erb :'/questions/new'
  end
end
