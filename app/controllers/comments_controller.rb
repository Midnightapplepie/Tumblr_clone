class CommentsController < ApplicationController
	def create
		# fail
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.save

	 	redirect_to article_path(@comment.article)
	end

	def comment_params
		params.require(:comment).permit(:author,:body)
	end
end
