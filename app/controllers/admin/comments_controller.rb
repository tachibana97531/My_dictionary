class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
  end

  def destroy
  end
end
