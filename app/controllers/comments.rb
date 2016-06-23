get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  erb :'comments/new'
end

post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = Comment.new(comment:params[:comment])
  if @comment.save
    erb :'questions/index'
  end
end

get '/questions/:answer_id/comments' do
  @question = Question.find(params[:question_id])
  erb :'comments/new'
end

post '/questions/:answer_id/comment' do
  @comment = Comment.new(comment:params[:comment])
end
