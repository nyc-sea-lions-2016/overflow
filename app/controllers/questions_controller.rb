get '/' do
  redirect '/questions'
end

get '/questions' do
  erb :'/questions/index'
end
