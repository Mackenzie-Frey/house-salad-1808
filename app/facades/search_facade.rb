class SearchFacade

  def initialize(state)
    @state = state
  end

  def member_count
    members.count
  end

  def members
    members_hashes = get_json[:results]
    members_hashes.map do |member_hash|
      Member.new(member_hash)
    end
  end

  def copyright
    get_json[:copyright]
  end

  private

  def get_json
    @response ||= conn.get("/congress/v1/members/house/#{@state}/current.json")

    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.propublica.org') do |faraday|
      faraday.headers['X-Api-Key'] = ENV["propublica_key"]
      faraday.adapter  Faraday.default_adapter
    end
  end


end
