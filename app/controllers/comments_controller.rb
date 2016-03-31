get '/comments/new' do
  erb :'/comments/_new'
end

post '/comments' do
  current_user

  redirect "questions/show!!!!!!"
end
