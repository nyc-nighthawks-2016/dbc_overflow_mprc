post '/votes/:vote_id/upvote' do
  @vote = Vote.find(params[:vote_id])
  @upvote = @vote.upvote.new(params[:upvote])
  if @upvote.save
    redirect "/votes/#{@vote.id}/upvote"
  else
    erb :'upvote/new'
  end
end

post '/votes/:vote_id/downvote' do
  @vote = Vote.find(params[:vote_id])
  @downvote = @vote.downvote.new(params[:downvote])
  if @downvote.save
    redirect "/votes/#{@vote.id}/downvote"
  else
    erb :'downvote/new'
  end
end
