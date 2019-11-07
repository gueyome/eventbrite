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
      flash[:danger] = "Vous n'êtes pas le créateur de cet évènement"
      redirect_to event_path(params[:event_id])
    end
  end

end
