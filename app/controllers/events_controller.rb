class EventsController < ApplicationController

  def index
    p @events = SearchHelper.event_search(params[:term], params[:location], params[:date].to_datetime) 
  end
end
