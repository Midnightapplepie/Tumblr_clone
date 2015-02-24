class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		@user.password = params[:user][:password_hash] 
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash.notice = @user.errors.messages
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find(params[:id])
		@article = Article.new
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password_hash)
	end
end
