get '/' do
  redirect '/questions'
end

get '/questions' do
  current_user
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  # refactor to only show if logged in
  if logged_in?
    erb :'/questions/new'
  else
    @errors = ['Must be logged in']
    erb :'/questions/index'
  end
end

post '/questions' do
  current_user
  @question = Question.new(params[:question].merge(user_id: @user.id))
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end
