get '/' do
   if current_user != nil
    erb :"static/home"
    else
    erb :"static/index"
    end
end