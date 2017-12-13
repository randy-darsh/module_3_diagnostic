class SearchController < ApplicationController
  def index
    @stations = Station.stations_by_zip_code(params[:q])
  end
end
