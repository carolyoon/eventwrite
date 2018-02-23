module SearchHelper

  include HTTParty
  # include awesome_print
  base_uri "eventbriteapi.com/v3/events/search"

  headers Authorization: "Bearer #{ENV['EB_API_KEY']}"

  default_params "start_date.range_end".to_sym => DateTime.now.to_s[0..-7]

  def self.event_search(location, keyword, start_date)
    response = self.get('', query: { q: keyword, 
                                     "location.address".to_sym => location,
                                     "start_date.range_start".to_sym => start_date.to_s[0..-7] })["events"]

    events = parse_events(response)
  end

  private

    def self.parse_events(response)
      response = response.map! { |event| event_details(event) }
      response.map! { |event_details| Event.find_or_create_by(event_details) }
    end 

    def self.event_details(event) 
      if !event["logo"]
        image_url = "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
      else 
        image_url = event["logo"]["url"]
      end 
      event_details = {
        name: event["name"]["text"],
        date: event["start"]["local"],
        image_url: image_url,
        event_url: event["url"]
      }
    end 

end
