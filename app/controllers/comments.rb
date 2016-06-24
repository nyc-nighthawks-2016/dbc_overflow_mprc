get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  if login?
    @action = "/questions/#{@question.id}/comments"
    erb :'comments/new'
  else
    @comment_error = ["Please login to continue."]
    erb :'/questions/show'
  end
end

post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = Comment.new(comment:params[:comment], commentable_id: params[:question_id], commentable_type:"Question", user_id:current_user.id)
  if @comment.save
    redirect "/questions/#{@question.id}"
  else 
    @errors = @comment.errors.full_messages
    erb :'questions/show'
  end
end

get '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  if login?
    @action = "/answers/#{@answer.id}/comments"
    erb :'comments/new'
  else
    @comment_error = ["Please login to continue."]
    erb :'/questions/show'
  end
end

post '/answers/:answer_id/comments' do
  answer = Answer.find(params[:answer_id])
  question = answer.question
  @comment = Comment.new(comment:params[:comment], commentable_id: answer.id, commentable_type:"Answer", user_id:current_user.id)
  if @comment.save
    redirect "/questions/#{question.id}"
  else 
    @errors = @comment.errors.full_messages
    erb :'questions/show'
  end
end

get '/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  erb :'comments/edit'
end

put '/comments/:comment_id' do
  comment = Comment.find(params[:comment_id])
  if comment.commentable_type == "Question"
    question = Question.find(comment.commentable_id)
  else
    answer = Answer.find(comment.commentable_id)
    question = answer.question
  end
  comment.comment = params[:comment]
  comment.save
  redirect "/questions/#{question.id}"
end

delete '/comments/:comment_id' do
  comment = Comment.find(params[:comment_id])
  answer = Answer.find(comment.commentable_id)
  @question = answer.question
  comment.destroy
  redirect "/questions/#{@question.id}"
end



