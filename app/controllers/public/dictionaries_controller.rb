class Public::DictionariesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :is_matching_login_user, only: [:edit]
  def new
    @dictionary = Dictionary.new
    @tag_list = @dictionary.tags.pluck(:tag_name).join('、')
  end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    @dictionary.user_id = current_user.id
    tag_list = params[:dictionary][:tag_name].split('、')
    if @dictionary.save
      @dictionary.save_tag(tag_list)
      redirect_to dictionary_path(@dictionary.id)
    else
      render :new
    end
  end

  def index
    dictionaries_open = Dictionary.where(post_status:true)
    @dictionaries = dictionaries_open.page(params[:page]).per(8)
    @tags = Tag.all
    if params[:tag_id].present?
      tag = Tag.find(params[:tag_id])
      dictionaries_tag = tag.dictionaries.where(post_status:true)
      @dictionaries = dictionaries_tag.page(params[:page]).per(8)
      @tag_f = Tag.find(params[:tag_id])
    end
  end

  def show
    @dictionary = Dictionary.find(params[:id])
    if @dictionary.post_status == "closing" && @dictionary.user != current_user
      flash[:notice] = "この辞書は現在非公開となっています。"
      redirect_to dictionaries_path
    end
    @tag_list = @dictionary.tags.pluck(:tag_name).join('、')
    @comment = Comment.new
  end

  def edit
    @dictionary = Dictionary.find(params[:id])
    @tag_list=@dictionary.tags.pluck(:tag_name).join('、')
  end

  def update
    @dictionary = Dictionary.find(params[:id])
    tag_list = params[:dictionary][:tag_name].split('、')
    if @dictionary.update(dictionary_params)
      @old_relations = TagPost.where(dictionary_id:@dictionary.id)
      @old_relations.each do |relations|
        relations.delete
      end
      @dictionary.save_tag(tag_list)
      redirect_to dictionary_path(@dictionary.id)
    else
      render :edit
    end
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    @dictionary.destroy
    redirect_to dictionaries_path
  end


  private

  def dictionary_params
    params.require(:dictionary).permit(:image,:title,:summery,:post_status,:dictionary_id)
  end

  def comment_params
    params.require(:comment).permit(:comment_contents)
  end

  def is_matching_login_user
    dictionary = Dictionary.find(params[:id])
    unless dictionary.user.id == current_user.id
      redirect_to root_path
    end
  end

end
