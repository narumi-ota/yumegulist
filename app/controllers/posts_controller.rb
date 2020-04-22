class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at: "desc").page(params[:page]).per(8)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました"
      redirect_to current_user
    else
      flash[:danger] = "投稿内容に不足があります"
      redirect_to current_user
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました"
    #redirect_to request.referrer || root_url
  end
  
    private

    def post_params
      params.require(:post).permit(:name, :content, :place, :rate, :picture)
    end
end