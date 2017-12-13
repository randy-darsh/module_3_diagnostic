class Station
  def initialize(attributes = {})
    @name = attributes[:station_name]
    @street_address = attributes[:street_address]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @fuel_types = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end

  def self.stations_by_zip_code(zip_code)
    nrel.stations_by_zip(zip_code).map do |raw_station|
      Station.new(raw_station)
    end
  end

  private

  def self.nrel
    NrelService.new
  end
end
