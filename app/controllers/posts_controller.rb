class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # byebug
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
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
    if @post.user.id != current_user.id
     redirect_to root_path
   end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
  
end
