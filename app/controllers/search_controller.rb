class SearchController < ApplicationController
  def index
    @stations = Station.closest_ten(params[:zip_code])
  end
end
