class JournalEntriesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @journal_entry = @event.journal_entry.create(journal_entry_params)
    if @journal_entry.save
      redirect_to user_path(current_user)
    else
      @errors = @journal_entry.errors.full_messages
      redirect_to attendance_path
    end
  end

  private
    def journal_entry_params
      params.require(:journal_entry).permit(:content, :author, :attendance)
    end
  end
end
