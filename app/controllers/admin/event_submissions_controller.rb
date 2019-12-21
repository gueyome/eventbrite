class Admin::EventSubmissionsController < ApplicationController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @admin_event_submissions = Event.where(validated: nil)
  end

  def update
    puts a = params[:id]
    @admin_event = Event.find(a)
    @admin_event.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], validated: params[:validated])
    
    flash[:success] = "Your event has been successfully modified"
    redirect_to event_path(@event.id)
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
