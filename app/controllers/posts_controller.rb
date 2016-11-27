class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
    @new_posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # ストロングパラメータを引数に
    @post.save # saveをしてデータベースに保存する。
    redirect_to "/posts/#{@post.id}" # showページにリダイレクト
  end

  def edit
  end

  def update
    @post.update(post_params) # saveをしてデータベースに保存する。
    redirect_to "/posts/#{@post.id}" # showページにリダイレクト
  end

  def destroy
    @post.destroy # saveをしてデータベースに保存する。
    redirect_to "/posts/" # indexページにリダイレクト
  end
  
  private

  def post_params # ストロングパラメータを定義する
    params.require(:post).permit(:title, :body, :category)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
