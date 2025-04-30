class Admin::PostAllController < ApplicationController
layout 'admin'
    before_action :authenticate_admin!
    def index
        @post_content = PostContent.all
    end
end
