class Station
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_type_code = attributes[:fuel_type_code]
    @access_days_time = attributes[:access_days_time]
  end

  def self.all_by_state(state)
    propublica.members_by_state(state).map do |raw_member|
      Member.new(raw_member)
    end
  end

  private

  def self.propublica
    PropublicaService.new
  end
end