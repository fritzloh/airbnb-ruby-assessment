post '/properties/create' do

	if logged_in?
		@property = current_user.properties.create(params[:property])
	
		erb :"static/user_page"
	
	end
end


get '/properties' do
	if logged_in?
		@properties = Property.all
		erb :'static/user_page.erb'
	end

end



patch '/properties/:property_id' do
	property = Property.find(params[:property_id])
	property.update(params[:property])
	
	erb :"/static/user_page"
end



delete '/properties/:property_id' do
	property = Property.find(params[:property_id])

	if property.nil?
		
	erb :"/static/user_page"
	else
		property.destroy
		
	erb :"/static/user_page"
	end
end