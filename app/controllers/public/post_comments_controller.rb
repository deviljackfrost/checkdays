class Public::PostCommentsController < ApplicationController

 def create
    post_content = PostContent.find(params[:post_content_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_content_id = post_content.id
    if comment.save
    flash[:notice] = "コメントを投稿しました。"
    redirect_to post_content_path(post_content)
    else
    flash[:notice] = "コメントを投稿できませんでした"  
    redirect_to post_content_path(post_content)
    end
  end
  
  def edit
    @post_comment = PostContent.find(params[:id])
    
  end
  
  def destroy
    PostComment.find(params[:id]).destroy  
    flash[:notice] = "コメントを削除しました。"
    redirect_to post_content_path(params[:post_content_id])
  end
  
    def update
    post_content_post_comment = PostContent.find(params[:post_content_id])
    post_content_post_comment.update(post_comment_params)
    redirect_to post_content_path
  end



  private
  
def post_comment_params
  params.require(:post_comment).permit(:title, :caption, :content, :comment)
end


end
