class SearchController < ApplicationController
  def index
    @stations = NrelService.new({location: params[:q]}).stations
  end
end
