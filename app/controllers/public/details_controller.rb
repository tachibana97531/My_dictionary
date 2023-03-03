class Public::DetailsController < ApplicationController
  def new
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.new
  end

  def create
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.new(detail_params)
    @detail.dictionary_id = @dictionary.id
    @detail.save
    redirect_to dictionary_details_path(@dictionary)
  end

  def index
    @dictionary = Dictionary.find(params[:dictionary_id])
    @details = Detail.all
  end

  def show
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail =  Detail.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def detail_params
    params.require(:detail).permit(:word,:read,:explanation)
  end

end
