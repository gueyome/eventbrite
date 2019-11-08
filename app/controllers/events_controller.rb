class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :user_admin?, only: [:edit, :destroy, :update]
  
  def index
    @events = Event.all.reorder('id')
  end

  def new
    @event = Event.new
  end
  
  def show
    puts a = params[:id]
    @event = Event.find(a)
  end

  def create
    @event = Event.create!(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)
    flash[:success] = "Votre évènement a été créé avec succès"
    redirect_to event_path(@event.id)
  end

  def edit
    puts a = params[:id]
    @event = Event.find(a)
  end

  def update
    puts a = params[:id]
    @event = Event.find(a)
    @event.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
    
    flash[:success] = "Votre évènement a été modifié avec succès"
    redirect_to event_path(@event.id)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
    flash[:success] = "Votre évènement a bien été supprimé"
  end

  private

  def user_admin?
    if current_user != nil
      unless Event.find(params[:id]).admin_id == current_user.id || current_user.is_admin == true
        flash[:danger] = "Vous n'êtes pas le créateur de cet évènement"
        redirect_to root_path
      end
    else 
      flash[:danger] = "Vous n'êtes pas le créateur de cet évènement"
      redirect_to root_path
    end
  end

end
