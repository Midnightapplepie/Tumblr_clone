class ArticlesController < ApplicationController
	include ArticlesHelper
	before_action :current_user

	def index
		@articles = Article.all
		@articles_count = Article.count
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		# fail 
		@article = Article.new(validated_params)
		@article.save
		@article.update(user_id: session[:user_id])
		flash.notice = "Your piece has been created."
		respond_to do |format|
			format.js 
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		# fail 
		@article = Article.find(params[:id])
		@article.update(validated_params)

		flash.notice = "Your piece has been updated."

		redirect_to article_path(@article)
	end

	def destroy
		@id = params[:id]
		Article.destroy(params[:id])

		flash.notice = "Your piece has been destroyed."

		respond_to :js
	end

	private 

	def current_user
		@user = User.find_by(id: session[:user_id])
	end
end
