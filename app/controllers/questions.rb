
get '/questions' do
  @questions = Question.all.order(visits: :desc)
  erb :'questions/index'
end

get '/questions/new' do
  if login?
    erb :'questions/new'
  else
    @errors = ["Login to post a question."]
    erb :"/users/login"
  end
end

post '/questions' do
  @question = Question.new(params)
  @question.user = current_user
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])

  @question.visits += 1
  @question.save
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @form_action = "/question/params[:id]"
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/edit'
  end
end

delete '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @question.destroy
  redirect '/questions'
end
