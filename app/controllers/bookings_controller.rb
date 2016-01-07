post '/bookings/create' do

	if logged_in?

		@booking = current_user.bookings.create(params[:bookings])
	
		redirect '/'	
	end
end


get '/bookings' do
	
	if logged_in?
		@booking = Booking.all

		redirect '/'
	end

end



patch '/bookings/:booking_id' do
	property = Property.find(params[:booking_id])
	property.update(params[:property])
	
	redirect to "/"
end



delete '/bookings/:booking_id' do
	property = Property.find(params[:booking_id])

	if property.nil?
		
		redirect to "/"
	else
		property.destroy
		
		redirect to "/"
	end
end