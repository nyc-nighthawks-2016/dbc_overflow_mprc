get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  if logged_in?
    erb :'questions/new'
  else
    @errors = ["Login to post a question."]
    erb :"/users/login"
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
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

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
