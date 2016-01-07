post '/comments/create' do

	if logged_in?
		@comment = current_user.comments.create(comment: params[:comments][:comment], property_id: params[:comments][:property_id])
	
		erb :"static/home"
	end
end


get '/comments' do
	if logged_in?
		@comment = Comment.all

		redirect to '/static/home'
	end
end



patch '/comments/:comment_id' do
	comment = Comment.find(params[:comment_id])
	comment.update(params[:property])
	
	redirect to "/"
end



delete '/comments/:comment_id' do
	comment = Comment.find(params[:comment_id])

	if comment.nil?
		
		redirect to "/"
	else
		comment.destroy
		
		redirect to "/"
	end
end