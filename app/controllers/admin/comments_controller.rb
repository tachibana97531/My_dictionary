class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  def index
    @comments = Comment.all
  end

  def show
  end

  def destroy
  end
end
