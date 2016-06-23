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
  @question = Question.new(question:params[:question],description: params[:description], user_id:current_user.id)
  if @question.save
    tags=params[:tags_list].split(' ')
    tags.each do |tag|
    tag.downcase!
    check_tag = Tag.find_by(name:tag)
      if !!check_tag
        QuestionTag.create(tag_id:check_tag.id, question_id:@question.id)
      else
        new_tag=Tag.create(name:tag)
        QuestionTag.create(question_id:@question.id, tag_id:new_tag.id)
      end
    end
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
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
