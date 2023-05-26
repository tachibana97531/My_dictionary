class SearchesController < ApplicationController
  def search
    @dictionaries = Dictionary.opening.looks(params[:word])
  end
end
