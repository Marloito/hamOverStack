get '/' do
  p session[:user_id]
  'hey you made is'
end
