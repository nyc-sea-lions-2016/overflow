get '/votes_up' do

end

# /:id/votes

post '/votes_down' do
  # @vote_counter =  answer.votes.count
  @user = current_user
  @vote = Vote.new(user_id: @user.id)
  if @vote.save
    @vote_counter -= 1
  else
    @errors = ["You've already voted on this"]
  end
end
