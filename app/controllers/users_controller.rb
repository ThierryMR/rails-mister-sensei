class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @posts = Post.all
    @user = User.find(params[:id])
  end

  def new
    # New e get
    @user = User.new

  end

  def create
    # E o create eh post
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user)

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :job, :relationship, :github)
  end
end
