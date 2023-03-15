class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def create
    @dictionary = Dictionary.find(params[:dictionary_id])
    @comment = current_user.comments.new(comment_params)
    @comment.dictionary_id = @dictionary.id
    if @comment.save
       flash[:notice] = "コメントを作成しました。"
       redirect_to dictionary_comments_path(@dictionary)
    else
      flash[:notice] = "コメントを書いてください。"
      @dictionary = Dictionary.find(params[:dictionary_id])
      @comments = @dictionary.comments
      @comment = Comment.new
      render :index
    end
  end

  def index
    @dictionary = Dictionary.find(params[:dictionary_id])
    @comments = @dictionary.comments
    @comment = Comment.new
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to dictionary_comments_path(params[:dictionary_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_contents)
  end
end
