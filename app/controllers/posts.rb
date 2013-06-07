get '/posts/new' do
  erb :newpost
end

post '/posts/:id/delete' do
  Post.find(params[:id]).destroy
  redirect '/'
end

post '/posts/:id/update' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  if @post.save
    redirect '/'
  else
    @errors = @post.errors
    erb :editpost
  end
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :editpost
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @tags = []
  @tags = @post.tags if @post.tags.any?
  erb :post
end

post '/posts' do
  @post = Post.new(params[:post])
  puts session[:user]
  @post.user_id = User.find(session[:user]).id
  if @post.save
    redirect '/'
  else
    @errors = @post.errors
    erb :newpost
  end
end
