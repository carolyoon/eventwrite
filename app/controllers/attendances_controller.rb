class AttendancesController < ApplicationController
  include SessionsHelper

  def create
    if attended?
      flash[:notice]= "You already saved this event."
      redirect_back(fallback_location: events_path)
    else
      @attendance = current_user.attendances.new(event_id: params[:event_id])
      if @attendance.save
        redirect_to @attendance
      else
        redirect_back 
      end
    end
  end

  private

    def attended?
      Attendance.find_by(user: current_user, event_id: params[:event_id]) 
    end

end
