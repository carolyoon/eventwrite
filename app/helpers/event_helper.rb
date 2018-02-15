module EventHelper

  include HTTParty

  base_uri "eventbriteapi.com/v3/events/search"

  headers Authorization: "Bearer #{ENV['EB_API_KEY']}"

  default_params "start_date.range_end".to_sym => Date.today 

  def self.event_search(location, keyword, start_date)
    events = self.get('', query: { q: keyword, "location.address".to_sym => location,  "start_date.range_start" => start_date})["top_match_events"]
  end

end
