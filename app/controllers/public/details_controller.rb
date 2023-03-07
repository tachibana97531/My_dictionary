class Public::DetailsController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def new
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.new
  end

  def create
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.new(detail_params)
    @detail.dictionary_id = @dictionary.id
    if @detail.save
      flash[:notice] = "単語を作成しました。"
      redirect_to dictionary_details_path(@dictionary)
    else
      render :new
    end
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
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.find(params[:id])
  end

  def update
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.find(params[:id])
    @detail.dictionary_id = @dictionary.id
    @detail.update(detail_params)
    redirect_to dictionary_detail_path(@dictionary.id,@detail.id)
  end

  def destroy
    @dictionary = Dictionary.find(params[:dictionary_id])
    @detail = Detail.find(params[:id])
    @detail.dictionary_id = @dictionary.id
    @detail.destroy
    redirect_to dictionary_details_path(@dictionary.id)
  end


  private

  def detail_params
    params.require(:detail).permit(:word,:read,:explanation)
  end

end
