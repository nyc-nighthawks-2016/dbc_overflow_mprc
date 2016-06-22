get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :'answers/index'
end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'answers/new'
  end
end

delete '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@question.id}/answers"
end
