get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/login' do
  if login?
    redirect "/users/#{session[:user_id]}"
  else
    if request.xhr?
      erb :'users/login', layout:false
    else
      erb :'users/login'
    end
  end
end

post '/users/login' do
  @user= User.find_by(email:params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if request.xhr?
        erb :layout
      else
        redirect "/"
      end
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
  @user = User.find(params[:user_id])
  erb :'users/show'
end
