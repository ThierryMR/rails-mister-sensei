class PostsController < ApplicationController
  # before_action :set_post
  def index
    @posts = Post.all
  end

  def new
    # Colocando isso aqui, para fazer uns testes
    # No meu new.html.erb do post
    # Assim eu consigo da display desse conteudo
    # @user = User.all
    # @user = User.find(params[:user_id])
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    # Faria esssa conexao se o user e o post estivessem nested
    # @post.user = User.find(params[:user_id])
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  # def set_post
  #   @post = Post.find(params[:post].id)
  # end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
