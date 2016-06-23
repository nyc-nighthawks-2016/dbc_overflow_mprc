get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :'questions/show'
end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer_text=params[:answer]
  if login?
    @answer = Answer.new(answer:params[:answer], user_id:current_user.id, question_id:@question.id)
    if @answer.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @answer.errors.full_messages
      erb :'questions/show'
    end
  else
    @errors=["Please log in to answer a question."]
    erb :'questions/show'
  end
end

delete '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @question = Question.find(@answer.question_id)
  @answer.destroy
  redirect "/questions/#{@question.id}"
end

