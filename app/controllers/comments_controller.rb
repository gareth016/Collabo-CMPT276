class CommentsController < ApplicationController
	def create
		@comment.user = current_user
		@post = Post.find(params[:id])
		@comment = @post.comments.create( comment_params )
		redirect_to post_path(@post)
	end
	
	def destroy
		@post = Post.find(params[:id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end


	private
		def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
