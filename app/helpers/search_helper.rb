module SearchHelper

  include HTTParty

  base_uri "eventbriteapi.com/v3/events/search"

  headers Authorization: "Bearer #{ENV['EB_API_KEY']}"

  default_params "start_date.range_end".to_sym => DateTime.now.to_s[0..-7]

  def self.event_search(location, keyword, start_date)
    p response = self.get('', query: { q: keyword, 
                                   "location.address".to_sym => location,
                                   "start_date.range_start".to_sym => start_date.to_s[0..-7] })["events"]
    events = parse_events(response)
  end

  private

  def self.parse_date(date)
    date.to_s[0..-7]
  end

  def self.parse_events(events)
    events.map! { |event| event["id"] }
  end 


end
