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
  end

  # POST /admin/events
  # POST /admin/events.json
  def create
    @admin_event = Event.new(admin_event_params)

    respond_to do |format|
      if @admin_event.save
        format.html { redirect_to @admin_event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @admin_event }
      else
        format.html { render :new }
        format.json { render json: @admin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/events/1
  # PATCH/PUT /admin/events/1.json
  def update
    respond_to do |format|
      if @admin_event.update(admin_event_params)
        format.html { redirect_to @admin_event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_event }
      else
        format.html { render :edit }
        format.json { render json: @admin_event.errors, status: :unprocessable_entity }
      end
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
      flash[:danger] = "Vous n'êtes pas authorisé à accéder à cet espace"
      redirect_to root_path
      end
    end

end
