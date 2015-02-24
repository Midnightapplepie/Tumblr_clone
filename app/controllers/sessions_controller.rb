class SessionsController < ApplicationController

	def new
		@session = "New User"
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.password == params[:password_hash]
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash.notice = "incorrect email or password"
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
