class Public::CommentsController < ApplicationController
  def create
    @dictionary = Dictionary.find(params[:dictionary_id])
    @comment = current_user.comments.new(comment_params)
    @comment.dictionary_id = @dictionary.id
    @comment.save
    redirect_to dictionary_path(@dictionary)
  end

  def index
    @dictionary = Dictionary.find(params[:dictionary_id])
    @comments = @dictionary.comments
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to dictionary_path(params[:dictionary_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_contents)
  end
end
