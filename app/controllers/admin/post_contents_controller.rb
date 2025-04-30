class Admin::PostContentsController < ApplicationController
 before_action :authenticate_admin!
    def destroy
        @post_content = PostContent.find(params[:id])
        @post_content.destroy
        redirect_to admin_postall_path, notice: 'この投稿を削除しました。'
    end
end
