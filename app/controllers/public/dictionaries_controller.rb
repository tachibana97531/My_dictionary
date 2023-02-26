class Public::DictionariesController < ApplicationController
  def new
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    @dictionary.user_id = current_user.id
    tag_list = params[:dictionary][:tag_name].split(",")
    if @dictionary.save
      @post.save_tag(tag_list)
      redirect_to dictionary_path(@dictionary.id)
    else
      render new
    end
  end

  def index
    @tags = Tag.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  
  private
  
  def dictionary_params
    params.require(:dictionary).permit(:title,:summery,:post_status)
  end
  
end
