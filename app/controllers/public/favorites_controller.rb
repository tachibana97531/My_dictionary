class Public::FavoritesController < ApplicationController
  def create
    @dictionary = Dictionary.find(params[:dictionary_id])
    @favorite = current_user.favorites.new(dictionary_id:@dictionary.id)
    @favorite.save
    redirect_to dictionary_path(@dictionary)
  end

  def destroy
    @dictionary = Dictionary.find(params[:dictionary_id])
    @favorite = current_user.favorites.find_by(dictionary_id:@dictionary.id)
    @favorite.destroy
    redirect_to dictionary_path(@dictionary)
  end
end
