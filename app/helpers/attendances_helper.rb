module AttendancesHelper
  def find_attendance(user_id, event_id)
    @attendance = Attendance.find_by(user_id: user_id, event_id: event_id)
    @attendance.id
  end
end
