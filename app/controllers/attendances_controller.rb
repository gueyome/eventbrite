class AttendancesController < ApplicationController

    
    def index
      @event = Event.find(params[:event_id])
    end
  
    def new
      @attendance = Attendance.new
      @price = Event.find(params[:attendance][:event_id]).price
      @event_id = params[:attendance][:event_id]
    end

    def create

      puts @amount = params[:price].to_i * 100
      puts @event_id = params[:event_id]
      
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
  
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
        })

      @attendance = Attendance.new(user_id: current_user.id, event_id: params[:event_id], stripe_customer_id: customer.id)
      @attendance.save
      flash[:success] = "Payment successfully completed, you participate in the event"
      redirect_to event_path(@event_id)
  
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_event_attendance_path(@event_id)

    end

end
