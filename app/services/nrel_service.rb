class NrelService

  def initialize(filter = {})
    @filter = filter
  end

  def stations
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_KEY"]}&location=#{filter[:location]}&limit=10&radius=6.0&fuel_type=ELEC,LPG")
    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end
  
  private

  attr_reader :filter

  # def initialize
  #   @connection = Faraday.new(url: "https://api.data.gov") do |faraday|
  #     faraday.headers['X-Api-Key'] = ENV["NREL_KEY"]
  #     faraday.adapter Faraday.default_adapter
  #   end
  # end
  
  # def stations_by_zip(zip_code)
  #   get_json("/nrel/alt-fuel-stations/v1/nearest.json?fuel_type=LPG,ELEC&location=#{zip_code}&radius=6&limit=10")
  #   # get_json("/api/alt-fuel-stations/v1.json?zip=#{zip_code}&api_key=yEtMH5JrzYgDAYJv1iobx3sqqgaEGWvYSrOUQg1O&format=JSON")[:results]
  # end
  # this works for finding the nearest 10 stations now
  # https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?fuel_type=LPG,ELEC&location=80203&radius=6&limit=10&api_key=yEtMH5JrzYgDAYJv1iobx3sqqgaEGWvYSrOUQg1O
  # private

  # attr_reader :connection

  # def get_json(url)
  #   response = connection.get(url)
  #   JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  #   # JSON.parse(response.body, symbolize_names: true)
  # end
end
