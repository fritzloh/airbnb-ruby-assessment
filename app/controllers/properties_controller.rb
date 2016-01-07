post '/properties/create' do

	if current_user
		@property = current_user.properties.create(params[:property])
	
		erb :"static/user_page"
	
	end
end


get '/properties' do
	if current_user
		@properties = Property.all
		erb :'static/user_page.erb'
	end

end



patch '/properties/:property_id' do
	property = Property.find(params[:id])
	property.update(params[:property])
	
	redirect to "/"
end



delete '/properties/:property_id' do
	property = Property.find(params[:id])

	if property.nil?
		
		redirect to "/"
	else
		property.destroy
		
		redirect to "/"
	end
end