class Admin::EventsController < ApplicationController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_if_admin

  # GET /admin/events
  # GET /admin/events.json
  def index
    @admin_events = Event.all
  end

  # GET /admin/events/1
  # GET /admin/events/1.json
  def show
  end

  # GET /admin/events/new
  def new
    @admin_event = Event.new
  end

  # GET /admin/events/1/edit
  def edit
    @admin_event = Event.find(params[:id])
  end

  # POST /admin/events
  # POST /admin/events.json
  def create
    @admin_event = Event.create!(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)
    flash[:success] = "Your event has been successfully created"
    redirect_to event_path(@admin_event.id)
  end

  # PATCH/PUT /admin/events/1
  # PATCH/PUT /admin/events/1.json
  def update
    puts a = params[:id]
    @admin_event = Event.find(a)
    puts "#####################"
    puts params
    if @admin_event.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], validated: params[:validated])
      flash[:success] = "Your event has been successfully modified"
      redirect_to admin_root_path
    else
      flash[:error] = @admin_event.errors.full_messages.first
      render :edit
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.json
  def destroy
    @admin_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_event
      @admin_event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_event_params
      params.fetch(:admin_event, {})
    end

    def check_if_admin
      if current_user.is_admin == false
      flash[:error] = "You are not authorized to access this space"
      redirect_to root_path
      end
    end

end
