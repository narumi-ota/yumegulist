class PostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  
  def index
    @posts = Post.all.page(params[:page]).per(9).search(params[:search])
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:page]).per(3)
    @comment = Comment.new
  end
  
  def new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました。"
      redirect_to current_user
    else
      flash[:danger] = "投稿内容に不足があります。"
      redirect_to new_post_path
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました。"
    redirect_to request.referrer || root_url
  end
  
  def liked_index
    @user = current_user
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(9)
  end

    private

    def post_params
      params.require(:post).permit(:name, :content, :place, :rate, 
      :picture, :latitude, :longitude)
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end