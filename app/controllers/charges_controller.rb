class ChargesController < ApplicationController
    before_action :find_event_price
    def new
    end
  
    def create
      # Amount in cents
      @amount = @event_price
  
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
      redirect_to event_path(@event), notice:"Merci, le paiement de #{@event_price}€ a bien été pris en compte"
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private
  
    def find_event_price
      @event = Event.find(params[:event_id])
      @event_price = @event.price
    end
  end
  