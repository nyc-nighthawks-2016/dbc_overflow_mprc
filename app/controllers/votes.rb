post '/:question_id/upvote' do
  @question = Question.find(params[:question_id])
  if login?
    vote = Vote.create(voteable_id:params[:question_id],voteable_type:"Question", user_id: current_user.id, upvote:true)
  end
  redirect "/questions/#{@question.id}"
end

post '/:question_id/downvote' do
  @question = Question.find(params[:question_id])
  if login?
    vote = Vote.create(user_id: current_user.id, voteable_id:params[:question_id], voteable_type:"Question", upvote:false)
  end
  redirect "/questions/#{@question.id}"
end

post '/answers/:answer_id/upvote' do
  @answer=Answer.find(params[:answer_id])
  @question = @answer.question
  if login?
    vote = Vote.create(voteable_id:@answer.id,voteable_type:"Answer", user_id: current_user.id, upvote:true)
  end
  redirect "/questions/#{@question.id}"
end

post '/answers/:answer_id/downvote' do
  @answer=Answer.find(params[:answer_id])
  @question = @answer.question
  if login?
    vote = Vote.create(user_id: current_user.id, voteable_id:@answer.id, voteable_type:"Answer", upvote:false)
  end
  redirect "/questions/#{@question.id}"
end
