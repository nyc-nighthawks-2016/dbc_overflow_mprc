def login?
  !!session[:user_id]
end

def register_user
  redirect '/users/login' unless login?
end

def current_user
  User.find(session[:user_id])
end

# def user_authentication(user)
#   redirect '/' if current_user != user
# end
