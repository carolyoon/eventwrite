class EventsController < ApplicationController
  def index
    @events = SearchHelper.event_search(params[:term], params[:location], params[:date].to_datetime) 
  end
end
