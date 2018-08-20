class Api::PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]

  def index
    render json: Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: { message: @post.errors}, status: 400
    end
  end

  def show
    @post = find_game
    render json: @post
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render status: 400
    end
  end

  def destroy
    @post = find_game
    if @post.destroy
      render json: { message: "Post deleted"}, status: 204
    else
      render json: { message: "unable to locate post!"}, status: 400
    end
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :caption, :img_url, :likes)
  end
end
