class SearchController < ApplicationController

  

  def index
    p @date = DateTime.now.to_s[0..-7]
    p @events = SearchHelper.event_search("Oakland", "music", DateTime.now - 1.week)
    
  end

end
