class Public::PostContentsController < ApplicationController
  def new
    @post_content = PostContent.new
  end

  def index
   @q = PostContent.ransack(params[:q])
   @post_content = @q.result.page(params[:page]).order(created_at: :desc)
   @time = Time.current
   @post_all = PostContent.all
  end
  
  def show
    @post_content = PostContent.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post_content.post_comments.page(params[:page]).includes(:user)
  end
  
  
  def create
    @post_content = PostContent.new(post_content_params)
    @post_content.content = params[:content] 
     if current_user
      @post_content.user_id = current_user.id
     end
      if @post_content.save
      redirect_to post_contents_path, notice: "投稿に成功しました"
      else
      flash[:alert] = "投稿できませんでした入れ直してください"
      render :new
     end
  end

  def edit
    @post_content = PostContent.find(params[:id])
  end

  def update
    @post_content = PostContent.find(params[:id])
    @post_content.update(post_content_params)
    redirect_to post_content_path(@post_content.id)
  end

  def destroy
    @post_content = PostContent.find(params[:id])
    @post_content.destroy  
    flash[:notice] = "投稿を削除しました。"
    redirect_to post_contents_path(@post_content.id)
  end
  
  
private



def post_content_params
  params.require(:post_content).permit(:title, :caption, :content, :comment, :image)
end

end