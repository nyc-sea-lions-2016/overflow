post '/answers' do
  current_user
  @answer = Answer.create(body: params[:body], question_id: params[:questionid], user_id: @user.id)
  redirect "/questions/#{params[:questionid]}"
end

