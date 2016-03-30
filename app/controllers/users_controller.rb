get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ['Incorrect Username or Password']
    erb :'/users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
