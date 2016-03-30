get '/' do
  redirect '/questions'
end

get '/questions' do
  @user = User.find_by(id: session[:user_id])
  erb :'/questions/index'
end
