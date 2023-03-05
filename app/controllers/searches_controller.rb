class SearchesController < ApplicationController
  def search
    @dictionaries = Dictionary.looks(params[:word])
  end
end
