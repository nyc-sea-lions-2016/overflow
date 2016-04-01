post '/answers' do
  current_user
  @answer = Answer.create(body: params[:body], question_id: params[:questionid], user_id: @user.id)
  redirect "/questions/#{params[:questionid]}"
end

post '/answers/:id/votes' do

  @answer = Answer.find_by(id: params[:id])
  # @vote_counter = @answer.votes.count
  @user = current_user
  @vote = @answer.votes.build(user_id: @user.id)

  if @vote.save
    @vote_counter = @answer.votes.count
    erb :'/votes/_new', locals: {answer: @answer}
  else
    @errors = ["You've already voted on this"]
  end
end
