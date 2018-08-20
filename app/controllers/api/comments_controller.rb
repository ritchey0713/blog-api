class Api::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: { message: post.errors }, status: 400
    end
  end

  def show
    @comment = find_comment
    render json: @comment
  end

  def destroy
    @comment = find_comment
    if @comment.destroy
      render json: {message: 'comment destroyed!' }, status: 204
    else
      render json: {message: 'unable to locate this comment!'}, status: 400
    end
  end

  private

  def find_comment
    @comment = Comment.find_by(id: parmas[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :author, :post_id)
  end

end
