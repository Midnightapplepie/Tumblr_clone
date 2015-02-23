class SessionsController < ApplicationController

	def new
		@session = "New User"
	end

	def create
		user = User.find_by(email: params[:email])
		puts params[:email]
		puts params[:password_hash]
		# if user && user.authenticate(params[:password])
		if user && user.password_hash == params[:password_hash]
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			redirect_to new_session_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path
	end

	def user_params
		params.require(:user).permit(:email, :password_hash)
	end
end
