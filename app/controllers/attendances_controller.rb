class AttendancesController < ApplicationController
  include SessionsHelper

  def create
    p "*" * 80
    p params
    @attendance = current_user.attendances.new(event_id: params[:event_id])
    if @attendance.save
      redirect_to @attendance
    else
      redirect_back 
    end
  end
end
