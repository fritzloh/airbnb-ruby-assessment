post '/bookings/create' do

	if current_user
		@booking = current_user.bookings.create(params[:bookings])
	
		redirect '/'	
	end
end


get '/bookings' do
	if current_user
		@booking = Booking.all

		redirect '/'
	end

end



patch '/bookings/:booking_id' do
	property = Property.find(params[:id])
	property.update(params[:property])
	
	redirect to "/"
end



delete '/bookings/:booking_id' do
	property = Property.find(params[:id])

	if property.nil?
		
		redirect to "/"
	else
		property.destroy
		
		redirect to "/"
	end
end