class Public::PostCommentsController < ApplicationController

  def show
    @post_comment = PostComment.find(params[:id])  
  end

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
    @post_comment = PostComment.find(params[:id])
     @post_content = PostContent.all
  end
  
  def destroy
    PostComment.find(params[:id]).destroy  
    flash[:notice] = "コメントを削除しました。"
    redirect_to post_content_path(params[:post_content_id])
  end
  
  def update
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
     flash[:notice] = "コメントを編集しました。"
     redirect_to  post_content_path(@post_comment.post_content_id)
    else
     flash[:alert] = "内容変更できませんでした入れ直してください"
     render :edit
   end
  end



  private
  
def post_comment_params
  params.require(:post_comment).permit(:title, :caption, :content, :comment, :id, :post_content_id)
end


end
