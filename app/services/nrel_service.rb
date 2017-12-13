class NrelService
  def initialize
    @connection = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end