class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:dictionary_id)
    @favorite_dictionaries = Dictionary.find(favorites)
  end


  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:production,:email,:telephone_number,:postal_code,:address)
  end
end
