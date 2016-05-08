class PostsController < ApplicationController
  def index
    @posts = Post.all

    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(create_params)

    if @post.save
      redirect_to action: :index
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(create_params)
      redirect_to action: :index
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy

    redirect_to action: :index
  end

  private

  def create_params
    params.require(:post).permit(:title, :body)
  end
end
