class NrelService
  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def stations_by_zip(zip_code)
    get_json("/api/alt-fuel-stations/v1.json?zip=#{zip_code}?fuel_type=E85,ELEC&limit=10&api_key=yEtMH5JrzYgDAYJv1iobx3sqqgaEGWvYSrOUQg1O&format=JSON")[:results]
  end

  private

  attr_reader :connection

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end