post '/answers' do
  current_user
  @answer = Answer.create(body: params[:body], question_id: params[:questionid], user_id: @user.id)
  redirect "/questions/#{params[:questionid]}"
end

post '/answers/:id/upvotes' do
  current_user
  @answer = Answer.find_by(id: params[:id])
  @vote = Vote.find_by(user_id: @user.id, votable_id: @answer.id, votable_type: 'Answer') || @answer.votes.build(user_id: @user.id)
  @vote.upvote
  @vote.save
  redirect "questions/#{@answer.question_id}"
end

post '/answers/:id/downvotes' do
  current_user
  @answer = Answer.find_by(id: params[:id])
  @vote = Vote.find_by(user_id: @user.id, votable_id: @answer.id, votable_type: 'Answer') || @answer.votes.build(user_id: @user.id)
  @vote.downvote
  @vote.save
  redirect "questions/#{@answer.question_id}"
end


