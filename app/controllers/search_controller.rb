class SearchController < ApplicationController

  def index
    @events = SearchHelper.event_search("Oakland", "music", DateTime.now - 1.week)   
  end

end
