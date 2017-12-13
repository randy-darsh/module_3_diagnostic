class Station
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_type_code = attributes[:fuel_type_code]
    @access_days_time = attributes[:access_days_time]
    @zip_code = attributes[:zip]
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