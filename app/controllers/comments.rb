get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  if login?
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
  # @question = answer.question
  if login?
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

delete '/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @question = Question.find(@comment.commentable_id)
  @comment.destroy
  redirect "/questions/#{@question.id}"
end

