class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy] 
  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def create
    @group = Group.new(group_params) 
    @group.owner = current_user
    if @group.save
      redirect_to groups_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ作成に失敗しました.内容を入れ直してください"
      render :new
    end
  end

  def index
    @groups = Group.all
  end
  
def members
  @group = Group.find(params[:id])
  @members = @group.users
  render 'members'
end

  def show
    @group = Group.find(params[:id])
    @users = @group.users 
    @owner_user = User.find(@group.owner_id) 
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group.id), notice: 'グループを編集しました'
    else
      flash[:alert] = 'グループ内容が変更できません、編集し直してください'
      render 'edit'
    end
  end
  
   def update_status
    @group = Group.find(params[:id])
    new_status = params[:group][:status]
    if @group.update(status: new_status)
      redirect_to @group, notice: 'Status updated successfully'
    else
      flash[:alert] = 'Failed to update status'
      render 'show'
    end
  end
  
  def join
    group = Group.find(params[:id])
    current_user.groups << group
    group.update(status: :参加)
    redirect_to group, notice: 'グループに参加しました'
  end

  def leave
    group = Group.find(params[:id])
    current_user.groups.delete(group)
    group.update(status: :未参加)
    redirect_to group, notice: 'グループから抜けました'
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :status )
  end

  def ensure_correct_user 
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to group_path(@group), alert: "グループオーナーのみ編集が可能です"
    end
  end
end