class Admin::PostCommentsController < ApplicationController
  
  
  
  def destroy
        @post_comment = PostComment.find(params[:id])
        @post_comment.destroy
        redirect_to admin_commentall_path, notice: 'このコメントを削除しました。'
  end
end
