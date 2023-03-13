class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def index
  end

  def show
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:dictionary_id)
    @favorite_dictionaries = Dictionary.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  def favorite_user_dictionary
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:dictionary_id)
    @favorite_dictionaries = Dictionary.find(favorites)
  end


  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:production,:email,:telephone_number,:postal_code,:address)
  end
end
