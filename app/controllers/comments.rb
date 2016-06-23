get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  erb :'comments/new'
end

post '/questions/:question_id/comment' do
  # "Hello World"
end