class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params[:state])
  end
end
