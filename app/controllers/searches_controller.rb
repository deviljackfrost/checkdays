class SearchesController < ApplicationController
 def search
 @q = PostContent.ransack(params[:q])
  @boards = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")


  respond_to do |format|
    format.html 
  end
 end
 

end
