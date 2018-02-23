class JournalEntriesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @journal_entry = @event.journal_entry.create(journal_entry_params)
    redirect_to event_path(@event)
  end

  private
    def journal_entry_params
      params.require(:journal_entry).permit(:content, :author, :attendance)
    end
  end
end
