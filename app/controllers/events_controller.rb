class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :user_admin?, only: [:edit, :destroy, :update]
  before_action :event_validated?, only: [:show]
  
  def index
    @events = Event.where(validated: true).reorder('id')
  end

  def new
    @event = Event.new
  end
  
  def show
    puts a = params[:id]
    @event = Event.find(a)
  end

  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)
    if @event.save
      flash[:success] = "Your event has been successfully created"
      redirect_to event_path(@event.id)
    else
      flash[:error] = @event.errors.full_messages.first
      render :new
    end
  end

  def edit
    puts a = params[:id]
    @event = Event.find(a)
  end

  def update
    puts a = params[:id]
    @event = Event.find(a)
    if @event.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
      flash[:success] = "Your event has been successfully modified"
      redirect_to event_path(@event.id)
    else
      flash[:error] = @event.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
    flash[:success] = "Your event has been deleted"
  end

  private

  def user_admin?
    if current_user != nil
      unless Event.find(params[:id]).admin_id == current_user.id || current_user.is_admin == true
        flash[:error] = "You are not the creator of this event"
        redirect_to root_path
      end
    else 
      flash[:error] = "You are not the creator of this event"
      redirect_to root_path
    end
  end

  def event_validated?
    if Event.find(params[:id]).validated != nil
      unless Event.find(params[:id]).validated == true
        flash[:error] = "This event is not yet validated and displayed"
        redirect_to root_path
      end
    else
      flash[:error] = "This event is not yet validated and displayed"
      redirect_to root_path
    end
  end

end
