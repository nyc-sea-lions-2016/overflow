get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/login' do
  if logged_in?
    @errors = ['You are already logged in.']
    erb :'/questions/index'
  else
    erb :'/users/login'
  end
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
