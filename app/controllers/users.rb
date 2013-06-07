get '/users/signup' do
  erb :signup
end

post '/users/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user.id
    redirect '/'
  else
    @errors = @user.errors
    erb :signup
  end
end

get '/users/login' do
  erb :login
end

post '/users/login' do
  @user = User.find_by_email(params[:user][:email])
  if @user.password == params[:user][:password]
    session[:user] = @user.id
    redirect '/'
  else
    @errors = { error: "Invalid email/password combination" }
    erb :login
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id/posts' do
  @user = User.find(params[:id])
  @posts = Post.where(user_id: params[:id])

  erb :userpage
end
