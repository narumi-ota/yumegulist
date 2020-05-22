class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.picture = "images/default.jpg"
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを確認してアカウントを有効化してください。"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:page]).per(9)
    @gones = Gone.where(user_id: @user.id).page(params[:page]).per(9)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :picture)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = ”ログインしてください。”
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end