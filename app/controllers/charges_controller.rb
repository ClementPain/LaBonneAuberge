class ChargesController < ApplicationController
    before_action :find_event_price
    def new
    end
  
    def create
      # Amount in cents
      @amount = @event_price*100
  
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

      if Attendance.where(user_id: current_user.id, event_id:@event.id).exists?
        redirect_to events_path, alert: "Vous participez déjà à l'évènement"
      else
        @event.attendances.create(user_id: current_user.id)
        redirect_to event_attendances_path(@event), notice:"Merci, le paiement de #{@event_price}€ a bien été pris en compte"
      end
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private
  
    def find_event_price
      @event = Event.find(params[:event_id])
      @event_price = @event.price
    end

    def attendancy
      
    end
  end
  