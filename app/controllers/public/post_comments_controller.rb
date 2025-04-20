class Public::PostCommentsController < ApplicationController

 def create
    post_content = PostContent.find(params[:post_content_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_content_id = post_content.id
    comment.save
    redirect_to post_content_path(post_content)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
