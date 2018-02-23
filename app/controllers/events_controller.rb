class EventsController < ApplicationController
  def index
    @events = SearchHelper.event_search(params[:keyword], params[:location], params[:date].to_datetime) 
  end

  def show
    @event = Event.find(params[:id])
  end
end
