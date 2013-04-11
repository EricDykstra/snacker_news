get '/' do
  @posts = Post.all.sort_by &:vote_count_reverse
  erb :index
end

get '/login' do
  erb :login
end

get '/item/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments.sort_by &:vote_count_reverse
  erb :item
end

post '/comment/add' do
  user = User.find(session[:id])
  user.comments.create( :post_id => params[:postid],
                        :content => params[:comment][:content])
  redirect '/item/' + params[:postid]
end

get '/profile/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/item/:postid' do
  Postvote.create(:user_id => session[:id],
                  :post_id => params[:postid])
  redirect '/item/' + params[:postid]
end

#sessions
post '/sessions' do
  @user = User.find_by_email(params[:user][:email])
  if @user
    if @user.password == params[:user][:password]
      session[:id] = @user.id
      redirect '/'
    else
      # @error = "Invalid username or password"
      redirect '/?error=Invalid%20username%20or%20password'
    end
  else
    @user = User.create(params[:user])
      session[:id] = @user.id
      redirect '/'
  end
end

#end a session
delete '/sessions' do
  session.clear
end

get '/post/new' do
  erb :submit_post
end

post '/post/new' do
  if Post.where('url = ?', params[:post][:url]).length == 0
    Post.create(params[:post])
  else
    redirect '/?error=Article%20already%20posted'
  end
end
