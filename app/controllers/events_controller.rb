class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @events = Event.all.reorder('id')
  end

  def new
    @event = Event.new
  end
  
  def show
    puts params
    puts a = params[:id]
    @event = Event.find(a)
  end

  def create
    puts "******************TEST2"
    puts params
    puts "******************TEST2"
    @event = Event.create!(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)
    redirect_to event_path(@event.id)
  end


end
