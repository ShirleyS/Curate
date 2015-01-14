ActiveRecord::Base.clear_active_connections!
require 'json'
require 'bcrypt'
get '/' do
  # @events = Event.all
  if session[:user_id]
    @users = User.all
  
  end
    erb :index

end


get '/resources' do
  #TODO IMPLEMENT ME


  @results = Resource.where(url: @search_term)
  @comments = Comment.where(resource_id: @results)

  @rating_avg = @results.average('rating').to_s

  # Quick hack. Will add more than one in the future.  
  @resources = Resource.all

  @r=Resource.includes(:comments).last
  @comment=Comment.includes(:resource).last

  # @comment.each_with_index do |com,i| 
     @com=@comment
     @res=Resource.find(@comment.id)
  # end
  
  erb :resources
end


get '/extension' do

end


get '/recommendations' do
  if session[:user_id]
    erb :recommendations
  else
    erb :no_recs
  end
end


post '/search/:term' do

  # @urlMode.findBy(url) if  @Urlmodel.isURL?
  # @tagModel.findBy_topten if @tagModel.isTag?
  # tag.URL?
  #   @grabMatch = Resources.where(@search_term = Resource.url
  #     p all search terms

  # elsif
  #   @grabMatch = Resources.where(@search_term = Resource.url)

  # else
  #   "THIS PAGE HAS NOT BEEN RATED.  WOULD YOU LIKE TO RATE IT."

  # end
  redirect '/results/:term'
end

get '/search/:term' do

  @search_term = params[:resources][:term]

  if Resource.find_by_url(@search_term)
  
    @results = Resource.where(url: @search_term)
    @comments = Comment.where(resource_id: @results)
    @rating_avg = @results.average('rating').to_s
    @result_url = @results.last.url
    # @user = @results.find_by(user_id: results.user_id)
  
    @comment=Comment.includes(:resource).last
    # @comment.each_with_index do |com,i| 
    @com=@comment
    @res=Resource.find(@comment.id)

  end 

  erb :results
end


get '/search' do
  redirect "/"
end



get '/profile' do

end


get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  @user = User.create(email: params[:user][:email], password: params[:user][:password], username: params[:user][:username])
  @user.password = params[:user][:password]
  @user.save!
  session[:user_id] = @user.id
  redirect "/"
end





post '/signin' do

  p params[:user][:email]
  @user = User.find_by_email(params[:user][:email])
 
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id

    redirect "/"
  else
    @message = "Does not compute. Please try again"
    redirect "/signin"
  end
end

get '/signin' do
  @message = "Sign In"
  if session[:user_id] 
    redirect "/newreview"
  else
    erb :signin
  end
end

# delete '/signout/:id' do
#   session[:user_id] = nil
#   redirect '/'
# end

get '/newreview' do
  @user_id=session[:user_id]
  erb :newreview
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end



post '/add_resource' do
  data = JSON.parse(params.to_json)
  @resource = Resource.create({
  title:            params["title"],
  url:              params["url"],
  rating:           params["rating"]
})


  if @resource.save
    @user_id=session[:user_id]
    @comment = @resource.comments.create(comment: params["comment"])
    @comment.save
    @tag = @resource.tags.create(tag: params["tag"])
    @tag.save

    @results = Resource.where(url: @search_term)
    @comments = Comment.where(resource_id: @results)

    @rating_avg = @results.average('rating').to_s
    
    erb :resources
  else

    @resources = @resource.errors
    p @resources
    erb :index
  end
end



post '/newfromsite' do
  data = JSON.parse(params.to_json)
  @resource = Resource.create({
  title:            params["title"],
  url:              params["url"],
  rating:           params["rating"]
})


  if @resource.save
    p "********************"
    p "********************"
    p session[:user_id]
    p "********************"
    p "********************"

    @comment = @resource.comments.create(comment: params["comment"], user_id: session[:user_id])
    @comment.save
    @tag = @resource.tags.create(tag: params["tag"])
    @tag.save
    @resources=Resource.all

    erb :resources

  else

    @resources = @resource.errors
    p @resources
    redirect '/newreview'
  end
end

