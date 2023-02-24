class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:production,:email,:telephone_number,:postal_code,:address)
  end
end
