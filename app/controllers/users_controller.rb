post '/users' do

    user = User.new(params[:user])
    if user.save 
    redirect to '/'
    else
    erb :"static/signupfail"
 	end
end


get '/users/:user_id' do

	erb :"static/user_page"
end