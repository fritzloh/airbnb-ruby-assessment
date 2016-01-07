post '/session/create' do
    
    user=User.find_by_email(params[:user][:email])
    if user.authenticate(params[:user][:password])
        session[:user_id]=user.id
        redirect '/session/:user_id'
    else
    erb :"static/loginfail"
    end
end


get '/session/:user_id' do
    user=User.find_by_id(session[:user_id])
    if user
        redirect '/'
    else
        redirect '/'
    end
end


post '/session/destroy' do
    session[:user_id] = nil
    'logged out'
    redirect '/'
end


