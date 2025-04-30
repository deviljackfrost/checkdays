class Admin::GroupController < ApplicationController
 before_action :authenticate_admin!
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
       redirect_to admin_groupall_path, notice: 'このグループを削除しました。'
    end
end
