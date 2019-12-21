class EventPicturesController < ApplicationController
  before_action :user_admin?, only: [:create]
  
  def create
    @event = Event.find(params[:event_id])
    @event.event_picture.attach(params[:event_picture])
    redirect_to(event_path(@event))
  end

  private

  def user_admin?
    unless Event.find(params[:event_id]).admin_id == current_user.id
      flash[:error] = "You are not the creator of this event"
      redirect_to event_path(params[:event_id])
    end
  end

end
