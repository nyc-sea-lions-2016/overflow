post '/questions/:id/comment' do
  erb :'/comments/_new_question'
end

post '/answers/:id/comment' do
  current_user
  @answer = Answer.find_by(id: params[:id])
  @comment = @answer.comments.build(body: params['body'], user_id: @user.id)
  @comment.save
   erb :'/comments/_show', locals: {answer: @answer, comment: @comment}, layout: false
end
