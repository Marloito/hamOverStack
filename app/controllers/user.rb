get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params)
  if user.validate
    user.save
    redirect '/sessions/new'
  else
    if request.xhr?
    else
      @errors = user.errors.full_messages
      erb :'users/new'
    end
  end
end
