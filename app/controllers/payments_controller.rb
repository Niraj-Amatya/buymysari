class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
  end

  def webhook
    # payment_id= params[:data][:object][:payment_intent]
    # payment = Stripe::PaymentIntent.retrieve(payment_id)
    # listing_id = payment.metadata.listing_id
    # user_id = payment.metadata.user_id

    # p "listing id " + listing_id
    # p "user id " + user_id

    event = Stripe::Event.construct_from(
      # p "user id " + user_id	            
      params.to_unsafe_h
      )

      # Handle the event
      case event.type
      when 'payment_intent.succeeded'
          payment_intent = event.data.object # contains a Stripe::PaymentIntent
          buyer = User.find(payment_intent.metadata.user_id)
            listing = Listing.find(payment_intent.metadata.listing_id)
            listing.bought = true
            listing.save
            order = Order.new
            order.user = buyer
            order.listing = listing
            order.save
          # Then define and call a method to handle the successful payment intent.
          # handle_payment_intent_succeeded(payment_intent)
      when 'payment_method.attached'
          payment_method = event.data.object # contains a Stripe::PaymentMethod
          # Then define and call a method to handle the successful attachment of a PaymentMethod.
          # handle_payment_method_attached(payment_method)
      # ... handle other event types
      else
          # Unexpected event type
          render :nothing => true, :status => :bad_request
          return
      end



    # success, but don't need to send anything back to Stripe
    head :no_content

  end
end
