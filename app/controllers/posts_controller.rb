class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # byebug
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:notice] = "Your post must have a title and content before publishing."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
