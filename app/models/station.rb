class Station
  attr_reader :name, :street_address, :fuel_types, :distance, :access_times

  def initialize(attributes = {})
    @attributes = attributes
    @name = attributes[:station_name]
    @street_address = attributes[:street_address]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @fuel_types = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end

  
  def street_address
    "#{@attributes[:street_address]}, #{@attributes[:city]}, #{@attributes[:state]} #{@attributes[:zip]}"
  end
  
  # def self.stations_by_zip_code(zip_code)
  #   nrel.stations_by_zip(zip_code).map do |raw_station|
  #     Station.new(raw_station)
  #   end
  # end
end
