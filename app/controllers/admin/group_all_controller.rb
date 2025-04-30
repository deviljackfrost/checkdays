class Admin::GroupAllController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    def index
        @group = Group.all
    end
    
     def destroy
        @group = Group.find(params[:id])
        @group.destroy
       redirect_to admin_group_path(group), notice: 'このグループを削除しました。'
    end
end
