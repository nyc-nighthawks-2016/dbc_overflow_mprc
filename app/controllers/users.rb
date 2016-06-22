get '/users' do
  #show all users links
end

get '/users/login' do
  if login?
    redirect "/users/#{session[:user_id]}"
  else
    erb :'users/login'
  end
end

post '/users/login' do
  @user= User.find_by(email:params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @error = "Email/password combination not found."
      erb :'users/login'
    end
end

get '/users/new' do
  if login?
    erb :'users/show'
  else
    erb :'users/new'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/login"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/logout' do
 session.clear
 redirect '/'
end

get '/users/:user_id' do
  if current_user == User.find(params[:user_id])
    @user = current_user
    erb :'users/show'
  else
    redirect '/'
  end
end
