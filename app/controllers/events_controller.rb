class EventsController < ApplicationController
  def index
    @events = Event.all.reorder('id')
  end

  def new

  end
  
  def show
    puts params
    puts a = params[:id]
    @event = Event.find(a)
  end


end
