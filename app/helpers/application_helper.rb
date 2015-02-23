module ApplicationHelper
	def current_user
		puts session[:user_id]
		puts session[:id]
		@user = User.find_by(id: session[:user_id])
	end
end
