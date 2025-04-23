class Public::HomesController < ApplicationController
  def top
    
  end

  def about
  end
  
    def create
    super do |resource|
      if resource.persisted?
        flash[:notice] = "ログインに成功しました"
      end
    end
  end
  
end

