class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  def index
    @users = User.all
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
    redirect_to admin_user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:telephone_number,:address,:postal_code,:is_deleted,:production)
  end


end
