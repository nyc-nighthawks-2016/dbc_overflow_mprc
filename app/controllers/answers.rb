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
    if current_user.id == @question.user_id
      @errors = ["You can't answer your own questions!"]
      erb :'questions/show'
    elsif @answer.save
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

get '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  erb :'answers/edit'
end

put '/answers/:answer_id' do
  answer = Answer.find(params[:answer_id])
  question = answer.question
  answer.answer = params[:answer]
  answer.save
  redirect "/questions/#{question.id}"
end

delete '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @question = Question.find(@answer.question_id)
  @answer.destroy
  redirect "/questions/#{@question.id}"
end


get '/users/:user_id/answers' do
  user = User.find(params[:user_id])
  @answers = Answer.where(user_id:user.id).order(updated_at: :desc)
  erb :'answers/show'
end