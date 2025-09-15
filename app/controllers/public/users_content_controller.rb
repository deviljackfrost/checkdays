class Public::UsersContentController < ApplicationController
  def new
     @user = current_user
  end
  
  def mypage
     @user = current_user
  end

  def show
     @user = User.find(params[:id])
     @post_content = @user.post_contents.page(params[:page])
  end

  def create
    if @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_content_path(@user)
    end
  end

  def edit
    @user = current_user
  end

  def update
   @user = current_user
   if @user.update(user_params)
       flash[:notice] = "登録を変更しました"
       redirect_to users_content_path(@user)
   else
       flash[:alert] = "登録を変更できませんでした,入力内容を確認してください"
       render :edit
   end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    sign_out(current_user)
    redirect_to new_user_session_path
  end
  
   private
   
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :image)
  end

end
