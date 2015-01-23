class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Buy a Package",
     amount: 1000
     }
  end

  def create
    # Amount in cents
    @amount = 1000

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
