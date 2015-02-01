class SubscribeController < ApplicationController

  # before_filter :authenticate_user!

  def new
  end

  def create
    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :plan => "001",
      :email => current_user.email
      )
    current_user.update_attribute(:role, 'subscriber')
    current_user.stripe_id = customer.id
    current_user.save
    flash[:notice] = "You are now travelling."
    redirect_to current_user

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_subscribe_path

  end

end
