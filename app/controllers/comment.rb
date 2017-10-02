post '/questions/:id' do
  puts "*" * 100
  type =  params[:commentable_type].strip
  if type == "Question"
    p "#" * 100
    question = Question.find(params[:id])
    question.comments << Comment.create(comment_body: params[:comment_body], user_id: session[:user_id])
  elsif type == "Answer"
    answer_id = params[:answer_id].strip
    answer = Answer.find(answer_id)
    answer.comments << Comment.create(comment_body: params[:comment_body], user_id: session[:user_id])
  end
    redirect "/questions/#{params[:id]}"
end
