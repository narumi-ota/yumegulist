class LikesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @post = Post.find(params[:post_id])
    @post.iine(current_user)
    flash[:success] = "「行きたいところリスト」に追加しました"
      respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @post = Like.find(params[:id]).post
    @post.uniine(current_user)
    flash[:danger] = "「行きたいところリスト」から削除しました"
      respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
  
  private 
  
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end