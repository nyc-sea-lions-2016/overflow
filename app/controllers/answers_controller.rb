post '/answers' do
  current_user
  @answer = Answer.create(body: params[:body], question_id: params[:questionid], user_id: @user.id)
  redirect "/questions/#{params[:questionid]}"
end

post '/answers/:id/votes' do
  current_user
  @answer = Answer.find_by(id: params[:id])
  @vote = @answer.votes.build(user_id: @user.id)

  if @vote.save
    {new_vote_count: @answer.votes.count}.to_json

  else
    @errors = ["You've already voted on this"]
  end
end
