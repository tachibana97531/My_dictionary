class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @dictionaries = Dictionary.looks(params[:search], params[:word])
  end
end
