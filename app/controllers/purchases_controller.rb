

class PurchasesController < ApplicationController

  before_action :authenticate_user!
  # before_action :check_cart

  def new

    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Your items amount to - #{current_user.cart_total_price}",
      amount: current_user.cart_total_price * 100
    }
    
  end

  def create
    # Get the credit card details submitted by the form
  token = params[:stripeToken]

  # Create a Customer
  customer = Stripe::Customer.create(
    :card => token,
    :description => current_user.email
  )

  # Charge the Customer instead of the card
  Stripe::Charge.create(
      :amount => current_user.cart_total_price * 100,
      :currency => "usd",
      :customer => customer.id
  )

  # exaime what returns from charge and save the unique id for that
  
  # Save the customer ID in your database so you can use it later
  save_stripe_customer_id(user, customer.id)

#################################################
  
  current_user.purchase_cart_destinations!

#####################################################



  flash[:notice] = "Destinations are coming to you!"
  redirect_to current_user

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_purchase_path



  # Later...
  customer_id = get_stripe_customer_id(user)

  Stripe::Charge.create(
    :amount   => 1500, # $15.00 this time
    :currency => "usd",
    :customer => customer_id
  )
  end




#   private

#   def check_cart
#     if current_user.get_cart_movies.blank?
#       redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
#     end
#   end

end
