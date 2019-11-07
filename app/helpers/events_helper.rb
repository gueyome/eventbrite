module EventsHelper
  
  def user_registered?(event)
    if Attendance.where(user_id: current_user.id, event_id: event.id).take == nil
      return false
    else true
    end
  end

  def user_admin?(event)
    event.admin_id == current_user.id
  end

end
