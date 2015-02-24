class FollowsController < ApplicationController
	def index
		@users = current_user.following

		render "users/index"
	end

	def create
		Follow.create(follower_id: params[:follower], following_id: params[:following])
		redirect_to :back
	end

	def destroy
		link = Follow.where(follower_id: params[:follower], following_id: params[:following])
		Follow.destroy(link.to_a)

		redirect_to :back
	end
end
