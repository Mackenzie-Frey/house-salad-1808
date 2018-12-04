class PropublicaService
  def initialize(filter)
    @filter = filter
  end

  def members_of_house
    get_json("/congress/v1/members/house/#{@filter[:state]}/current.json")
  end


  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.propublica.org') do |faraday|
      faraday.headers['X-Api-Key'] = ENV["propublica_key"]
      faraday.adapter  Faraday.default_adapter
    end
  end


end
