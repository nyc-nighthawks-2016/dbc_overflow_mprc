get '/tags' do 
  @tags = Tag.all
  erb :'tags/index'
end

get '/tags/:tag_id' do
  tag = Tag.find(params[:tag_id])
  @questions = tag.questions
  erb :'questions/index'
end

