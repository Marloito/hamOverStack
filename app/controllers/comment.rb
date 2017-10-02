post '/questions/:id' do
  question = Question.find(params[:id])
  question.comments << Comment.create(comment_body: params[:comment_body], user_id: session[:user_id])
  redirect "/questions/#{params[:id]}"
end
