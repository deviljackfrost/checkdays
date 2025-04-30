class Admin::CommentAllController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    def index
        @post_comment = PostComment.all
    end
end
