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
  @answer = @question.answers.new(answer:params[:answer], user_id:current_user.id, question_id:@question.id)
  if @answer.save
    redirect "/questions/#{@question.id}/answers"
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end

delete '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@question.id}/answers"
end


# <%if @question.user_id == current_user.id%>
#   <form>
#   #delete
#   </form
# <%end%>



# <%if @question.user_id == current_user.id%>
#   <form>
#     #edit
#   </form
# <%end%>


