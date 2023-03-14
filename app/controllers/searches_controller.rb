class SearchesController < ApplicationController
  def search
    @dictionaries_open = Dictionary.where(post_status:true)
    @dictionaries = @dictionaries_open.looks(params[:word])
  end
end
