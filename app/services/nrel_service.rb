class NrelService
  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def stations_by_zip(zip_code)
    get_json("/api/alt-fuel-stations/v1.json?zip=#{zip_code}&api_key=yEtMH5JrzYgDAYJv1iobx3sqqgaEGWvYSrOUQg1O&format=JSON")[:results]
  end
  # this works for finding one electric station in the 80203 zip code
  # https://developer.nrel.gov/api/alt-fuel-stations/v1.json?zip=80203&api_key=yEtMH5JrzYgDAYJv1iobx3sqqgaEGWvYSrOUQg1O&format=JSON
  private

  attr_reader :connection

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
